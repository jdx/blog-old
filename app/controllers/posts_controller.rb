class PostsController < ApplicationController
  def index
    @posts = Post.where('draft = ? and post_date <= ?', 'f', Time.zone.today)
  end

  def tag
    @tag = params[:tag]
    @posts = Post.where('draft = ? and post_date <= ?', 'f', Time.zone.today).tagged_with(@tag)
    render :index
  end

  def archive
    @post_months = Post
      .where('draft = ? and post_date <= ?', 'f', Time.zone.today)
      .group_by { |p| p.post_date.beginning_of_month }
  end

  def show
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    @related_posts = @post.find_related_tags.where('draft = ? and post_date <= ?', 'f', Time.zone.today).limit(5)
  end

  def redirect
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    redirect_to @post.permalink, status: 301
  end
end
