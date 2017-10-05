class AlbumImage < ApplicationRecord
  #rel
  belongs_to :album

  #mounts
  mount_uploader :image, AlbumImgUploader

  #delegate
  delegate :user, to: :album

  #counter
  counter_culture :album, column_name: :album_images_count
  counter_culture :album, column_name: :total_views, delta_column: :views
end
