class BlogsController < ApplicationController
  before_action :_set_blog, only: [:show]

  def index
    @blogs = Blog.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end

  def show 
  end 

  private 
  def _set_blog
    @blog = Blog.find(params[:id])
  end 
end
