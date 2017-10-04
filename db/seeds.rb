# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Album.delete_all
AlbumImage.delete_all
20.times do |n| 
  album = Album.new
  album.cover_image = File.open(File.join(Rails.root, 'tt.jpg'))
  album.user_id = 2 
  album.save!

  5.times do |m| 
    image = AlbumImage.new 
    image.image = File.open(File.join(Rails.root, 'tt.jpg'))
    image.views = m
    image.album = album
    image.save!
  end 
end

Blog.delete_all
30.times do |n| 
  Blog.create({user_id: 2, views: n, content: Faker::Lorem.paragraph(10, true, 3)})
end 