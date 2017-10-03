class AlbumImage < ApplicationRecord
  #rel
  belongs_to :album

  #mounts
  mount_uploader :image, AlbumImgUploader

  #delegate
  delegate :user, to: :album
end
