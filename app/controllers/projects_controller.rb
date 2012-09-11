class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    begin
      @project = Project.find_by_slug(params[:id])
      @project ||= Project.find(params[:id])
    rescue ActiveRecord::StatementInvalid
      # happens because google hits the url /1346265310000
      return render file: "public/404.html", status: 404, layout: false
    end
  end
end
