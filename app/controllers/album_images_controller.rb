class AlbumImagesController < ApplicationController
  before_action :_set_album

  def index 
    @images = @album.album_images.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end 

  private 

  def _set_album 
    @album = Album.find(params[:album_id])
  end 
end
