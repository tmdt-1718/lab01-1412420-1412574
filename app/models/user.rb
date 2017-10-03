class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  #validates
  validates :name, presence: true
  
  #enums
  enum role: [:user, :admin]

  #mounts
  mount_uploader :avatar, AvatarUploader

  #relationships
  has_many :albums


  def self.from_omniauth(auth)
    email = auth.info&.email 
    user = nil
    if email 
      user = User.find_by_email(email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else 
      user = where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
        u.email = auth.info.email
        u.password ||= Devise.friendly_token[0,20]
        u.name = auth.info&.name
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end
    user
  end
end
