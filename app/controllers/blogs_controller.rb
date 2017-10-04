class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end
end
