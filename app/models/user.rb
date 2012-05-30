class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :auth_token

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  after_create :generate_token

  def generate_token
    self.auth_token = Digest::SHA1.hexdigest(self.id.to_s + AUTH_SALT)
    self.save
  end
end
