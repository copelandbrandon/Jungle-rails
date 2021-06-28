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
  end
end
