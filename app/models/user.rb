class User < ActiveRecord::Base
  has_many :templates
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable, :omniauth_providers => [:facebook, :vkontakte]

  def is_admin?
    self.role == 'admin'
  end

  def self.find_for_facebook_oauth auth_hash
    where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
      user.email = auth_hash.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth_hash.info.name
    end
  end

  def self.find_for_vkontakte_oauth auth_hash
    where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
      user.email = auth_hash.uid + '@vk.com'
      user.password = Devise.friendly_token[0,20]
      user.name = auth_hash.info.name
    end
  end
end