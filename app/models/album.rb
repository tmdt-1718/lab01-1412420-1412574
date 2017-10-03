class Album < ApplicationRecord
  #rel
  has_many :album_images
  belongs_to :user

  #mounts
  mount_uploader :cover_image, CoverImageUploader  
end
