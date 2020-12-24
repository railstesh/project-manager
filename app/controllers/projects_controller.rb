class ProjectsController < ApplicationController
  before_action :load_project, only: %i[edit update destroy show]

  def index
    @projects = Project.without_deleted.paginate(page: params[:page], per_page: 9)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params) 

    if @project.save
      @project.descriptions.create(title: "#{@project.title} is created on #{@project.created_at}")
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      @project.assigns.each do |assign|
        @project.descriptions.create(title: "#{@project.title} is assign to #{assign.employee.name} on #{assign.created_at} as #{assign.assigned_as}")
      end
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def show
    @descriptions = @project.descriptions.paginate(page: params[:page], per_page: 6)
  end

  def inactive
    @projects = Project.only_deleted.paginate(page: params[:page], per_page: 9)
  end

  def restore
    @projects = Project.only_deleted
    @project = @projects.find(params[:id])
    @project.restore
    redirect_to inactive_projects_path
  end

  protected

  def project_params
    params.require(:project).permit(:title, :client_name, :profile_id, :work_limit, :invoice_type, technologies: [], assigns_attributes: [:id, :user_id, :project_id, :billing_hours, :assigned_as, :employee_id, :_destroy])
  end

  def load_project
    @project = Project.find(params[:id])
  end
end

