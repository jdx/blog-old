class PostsController < ApplicationController
  def index
    @posts = Post.order('post_date desc')
    @post_months = @posts.group_by { |p| p.post_date.beginning_of_month }
  end

  def tag
    @posts = Post.tagged_with(params[:tag]).order('post_date desc')
    @post_months = @posts.group_by { |p| p.post_date.beginning_of_month }
    @tag = params[:tag]
    render :index
  end

  def show
    @post = Post.find(params[:id])
    @related_posts = @post.find_related_tags
  end
end
