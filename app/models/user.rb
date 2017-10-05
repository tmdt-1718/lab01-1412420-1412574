class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  #validates
  validates :name, :student_id, presence: true
  
  #enums
  enum role: [:user, :admin]

  #mounts
  mount_uploader :avatar, AvatarUploader

  #relationships
  has_many :albums
  has_many :blogs
  belongs_to :group, optional: true

  #cb
  before_save :_set_default_group

  def self.from_omniauth(auth)
    email = auth.info&.email 
    user = User.find_by_email(email)
    if user 
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else 
      user = _create_user(auth)
    end 
    user
  end

  private 
  def _set_default_group
    group = Group.first
    unless group
      group = Group.create(name: 'Name')
    end
    self.group = group
  end 

  def self._create_user(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.email = auth.info.email
      u.password ||= Devise.friendly_token[0,20]
      u.name = auth.info&.name
      u.student_id = SecureRandom.hex 
    end
    user
  end 
end
