class ProjectsController < ApplicationController
  before_action :load_project, only: %i[edit update destroy]

  def index
    @projects = Project.all.order(:status)
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
    redirect_to projects_path
  end

  protected

  def project_params
    params.require(:project).permit(:title, :client_name, :profile, :work_limit, :technology, :invoice_type, :status, :active_discription, :inactive_discription)
  end

  def load_project
    @project = Project.find(params[:id])
  end
end

