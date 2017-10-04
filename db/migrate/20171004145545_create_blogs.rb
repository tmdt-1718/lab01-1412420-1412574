class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text :content
      t.references :user
      t.integer :views
      t.timestamps
    end
  end
end
