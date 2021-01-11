# frozen_string_literal: true

# class
class ProjectsController < ApplicationController
  before_action :load_project, only: %i[edit update destroy show]

  def index
    @projects = Project.without_deleted.processed_pagination(params[:page])
  end

  def new
    @project = Project.new
    @profile = Profile.new
    @technology = Technology.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      redirect_to new_project_path
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    redirect_to projects_path if @project.destroy
  end

  def show
    @descriptions = @project.descriptions.order(created_at: :desc).processed_pagination(params[:page])
    @assign = Assign.new
    @crediential = Crediential.new
  end

  def inactive
    @projects = Project.only_deleted.processed_pagination(params[:page])
  end

  def restore
    @projects = Project.only_deleted
    @project = @projects.find(params[:id])
    @project.restore
    redirect_to inactive_projects_path
  end

  private

  def project_params
    params.require(:project).permit(:tracker, :title, :client_name, :profile_id, :work_limit, :invoice_type, technologies: [])
  end

  def load_project
    @project = Project.find(params[:id])
  end
end
