class PostsController < ApplicationController

  caches_action :index, :show, expires_in: 10.minutes, unless: :admin_user_signed_in?

  def index
    @posts = Post.published
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
    @related_posts = @post.find_related_tags.published.limit(5)
  end

  def redirect
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    redirect_to @post.permalink, status: 301
  end
end
