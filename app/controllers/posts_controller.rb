class PostsController < ApplicationController
  def index
    @on_blog = true
    @posts = Post.where('draft = ? and post_date <= ?', 'f', Date.today).order('post_date desc')
    @post_months = @posts.group_by { |p| p.post_date.beginning_of_month }
  end

  def show
    @on_blog = true
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    @related_posts = @post.find_related_tags.where('draft = ? and post_date <= ?', 'f', Date.today).limit(5)
  end
end
