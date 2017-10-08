class AlbumsController < ApplicationController
  add_breadcrumb "Albums", :albums_path  
  def index
    @albums = Album.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end
end
