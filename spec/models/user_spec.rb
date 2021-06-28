require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user_params = { first_name:"Shmee", last_name:"Jibbly", email:"Sjibbly@gmail.com", password:"daChosenMum", password_confirmation:"daChosenMum" }
      @user = User.new(@user_params)
    end

    it 'should output error when password and confirmation fields do not match' do
      @user.password = "Padme"
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should save successfully when password and confirmation match' do
      @user.save!
    end

    it 'should output an error when password fields are blank' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should output an error if the email being used already exists in the db' do
      @user.save
      @user2 = User.new(first_name: "Gladys", last_name: "Gob", email: "Sjibbly@gmail.com", password:"idunnosomething", password_confirmation:"idunnosomething" )
      expect{@user2.save}.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it 'should ouput an error if no email first name or last name are provided' do
      @user.email = nil
      @user.first_name = nil
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank", "First name can't be blank", "Last name can't be blank")
    end

    it 'should output an error if password is too short' do
      @user.password = "123456789"
      @user.password_confirmation = "123456789"
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 10 characters)")
    end
  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user_params = { first_name:"Shmee", last_name:"Jibbly", email:"sjibbly@gmail.com", password:"daChosenMum", password_confirmation:"daChosenMum" }
      @user = User.new(@user_params)
      @user.save
    end

    it 'should return an instance of the user object when successfully authenticated' do
      @logged_in = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@logged_in).to be_a User
    end

    it "should return nil if the user doesn't exist given the wrong password" do
      @logged_in = User.authenticate_with_credentials(@user.email, "poqkwdqd")
      expect(@logged_in).to be nil
    end

    it 'should return nil if the user doesnt exist given the wrong email' do
      @logged_in = User.authenticate_with_credentials('skiobwel', @user.password)
      expect(@logged_in).to be nil
    end

    it 'should allow a user to log in with additional whitespace in the email' do
      @logged_in = User.authenticate_with_credentials(" sjibbly@gmail.com", @user.password)
      expect(@logged_in).to be_a User
    end

    it 'should allow a user to log in with accidental uppercase characters' do
      @logged_in = User.authenticate_with_credentials("sjibbly@GMAIL.COM", @user.password)
      expect(@logged_in).to be_a User
    end
  end
end
