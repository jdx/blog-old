class SitemapController < ApplicationController
  def index
    @posts = Post.all(:select => "slug, updated_at", :order => "updated_at DESC", :limit => 50000)
    @projects = Project.all(:select => "slug, updated_at", :order => "updated_at DESC", :limit => 50000)

    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end
