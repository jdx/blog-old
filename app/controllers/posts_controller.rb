class PostsController < ApplicationController
  def index
    @posts = Post.published.limit(5)
  end

  def tag
    @tag = params[:tag]
    @posts = Post.published.tagged_with(@tag)
    render :index
  end

  def archive
    @post_months = Post.published.group_by { |p| p.post_date.beginning_of_month }
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
