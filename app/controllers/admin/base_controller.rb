class Admin::BaseController < ApplicationController

  before_filter :authenticate_admin_user!

  def index
    redirect_to admin_posts_path
  end
end
