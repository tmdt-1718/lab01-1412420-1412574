class AlbumsController < ApplicationController
  before_action :_set_album, only: [:show]
  ITEMS_PER_PAGE = 10
  def index
    @albums = Album.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end

  def show
    @images = @album.album_images.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end 

  private 

  def _set_album 
    @album = Album.find(params[:id])
  end
end
