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
    redirect_to inactive_projects_path
  end

  protected

  def project_params
    params.require(:project).permit(:title, :client_name, :profile_id, :work_limit, :technology_id, :invoice_type, assigns_attributes: [:id, :user_id, :project_id, :assigned, :billing_hours, :assigned_as, :status, :active_discription, :inactive_discription, :employee_id, :_destroy])
  end

  def load_project
    @project = Project.find(params[:id])
  end
end

