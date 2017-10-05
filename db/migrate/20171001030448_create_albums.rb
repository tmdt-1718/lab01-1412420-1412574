class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :cover_image
      t.references :user, index: true
      t.integer :album_images_count
      t.integer :total_views
      t.timestamps
    end
  end
end
