class BlogsController < ApplicationController
  before_action :_set_blog, only: [:show]
  add_breadcrumb 'Blogs', :blogs_path
  
  
  def index
    @blogs = Blog.order(updated_at: :desc).page(params[:page]).per(ITEMS_PER_PAGE)
  end

  def show 
    add_breadcrumb @blog.id, blog_path(id: @blog.id)
  end 

  def new 
    @blog = Blog.new 
    add_breadcrumb 'New', :new_blog_path  
  end 

  def create
    @blog = Blog.new(_blog_params.merge(user: current_user))
    if @blog.save 
      redirect_to blog_path(id: @blog.id)
    else 
      render :new
    end
  end 

  private 
  def _set_blog
    @blog = Blog.find(params[:id])
  end 

  def _blog_params 
    params.require(:blog).permit(:content)
  end 
end
