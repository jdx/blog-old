class SitemapController < ApplicationController
  def index
    @posts = Post.published.order("updated_at DESC")
    @projects = Project.order("updated_at DESC")

    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end
