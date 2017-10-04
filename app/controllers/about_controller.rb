class AboutController < ApplicationController
  def index
    @group = Group.first
  end
end
