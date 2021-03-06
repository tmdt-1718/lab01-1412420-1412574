class AlbumImagesController < ApplicationController
  before_action :_set_album, :_increment_view_image, only: [:index]
  add_breadcrumb "Albums", :albums_path  
  

  def index 
    @images = @album.album_images.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
    add_breadcrumb @album.id, album_album_images_path(album_id: @album.id)
  end 

  private 

  def _set_album 
    @album = Album.find(params[:album_id])
  end 
  
  def _increment_view_image
    @album.album_images.each { |img| img.views += 1; img.save }
  end 
end
