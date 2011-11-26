class PostsController < ApplicationController
  def index
    @on_blog = true
    @post_months = Post.published.group_by { |p| p.post_date.beginning_of_month }
  end

  def show
    @on_blog = true
    @post = Post.find_by_slug(params[:id])
    @post ||= Post.find(params[:id])
    @related_posts = @post.find_related_tags.published.limit(5)
  end
end
