require 'digest/md5'

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email,
                  :password, :password_confirmation, :user_token

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email

  before_create :generate_token
  AUTH_SALT = "i<3Melanie"

  def generate_token
    self.user_token = Digest::SHA1.hexdigest(self.id.to_s + AUTH_SALT)
  end

  def avatar
    email_address = self.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "http://www.gravatar.com/avatar/#{hash}"
  end
end