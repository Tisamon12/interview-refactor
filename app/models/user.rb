class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tv_shows
  has_many :ranks

  after_create do
      self.update_attribute(:api_key, SecureRandom.hex)
  end
end
