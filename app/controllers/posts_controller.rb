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
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    @related_posts = @post.find_related_tags.published.limit(5)
  end

  def redirect
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    redirect_to @post.permalink, status: 301
  end
end
