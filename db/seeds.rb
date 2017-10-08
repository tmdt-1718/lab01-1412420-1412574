# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images = ['t1.jpg', 't2.jpg', 't3.jpg']

Album.delete_all
AlbumImage.delete_all
Blog.delete_all

user = User.first

12.times do |n| 
  album = Album.new
  album.cover_image = File.open(File.join(Rails.root, images.sample))
  album.user = user
  album.save!

  2.times do |m| 
    image = AlbumImage.new 
    image.image = File.open(File.join(Rails.root, images.sample))
    image.views = m
    image.album = album
    image.save!
  end 
end

30.times do |n| 
  Blog.create({user: user, views: n, content: Faker::Lorem.paragraph(10, true, 3)})
end 