class PostsController < ApplicationController

  def index
    @posts = Post.published.order('post_date desc')
  end

  def tag
    @tag = params[:tag]
    @posts = Post.published.tagged_with(@tag)
    render :index
  end

  def show
    begin
      @post = Post.find_by_slug(params[:id])
      @post ||= Post.find(params[:id])
    rescue ActiveRecord::StatementInvalid
      # happens because google hits the url /1346265310000
      return render file: "public/404.html", status: 404, layout: false
    end
    @related_posts = @post.related
  end

  def redirect
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    redirect_to @post.permalink, status: 301
  end
end
