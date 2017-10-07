class AboutController < ApplicationController
  add_breadcrumb "About", :about_index_path  
  def index
    @group = Group.first
  end
end
