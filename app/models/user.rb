class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 10}
  
  def self.authenticate_with_credentials email, password
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
