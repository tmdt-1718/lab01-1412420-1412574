class EditTableAlbums < ActiveRecord::Migration[5.1]
  def change
    change_column :albums, :album_images_count, :integer, null: false, default: 0
    change_column :albums, :total_views, :integer, null: false, default: 0
  end
end
