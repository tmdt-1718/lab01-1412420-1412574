class AlbumsController < ApplicationController
  def index
    @albums = Album.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end
end
