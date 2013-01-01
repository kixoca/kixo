class AdminUser < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable
end
