class CreateAlbumImages < ActiveRecord::Migration[5.1]
  def change
    create_table :album_images do |t|
      t.integer :views
      t.references :album, index: true
      t.string :image
      t.timestamps
    end
  end
end
