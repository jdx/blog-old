class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by_slug(params[:id])
    @project ||= Project.find(params[:id])
  end
end
