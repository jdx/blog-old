class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.order('post_date desc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    redirect_to edit_admin_post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :slug, :body, :image, :tags, :post_date, :draft, :link)
  end
end
