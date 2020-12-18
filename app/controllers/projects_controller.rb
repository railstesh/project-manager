class ProjectsController < ApplicationController
  before_action :load_project, only: %i[edit update destroy show]

  def index
    @projects = Project.without_deleted
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params) 

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    @project.update(status: 1)
    @project.destroy
    redirect_to projects_path
  end

  def show; end

  def inactive
    @projects = Project.only_deleted
  end

  def restore
    @projects = Project.only_deleted
    @project = @projects.find(params[:id])
    @project.restore
    @project.update(status: 0)
    redirect_to inactive_project_path
  end

  protected

  def project_params
    params.require(:project).permit(:title, :client_name, :profile, :work_limit, :technology, :invoice_type, :status, :active_discription, :inactive_discription)
  end

  def load_project
    @project = Project.find(params[:id])
  end
end

