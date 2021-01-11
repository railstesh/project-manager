# frozen_string_literal: true

# class
class AssignsController < ApplicationController
  before_action :load_assign, only: %i[edit update destroy show]

  def index
    @assigns = Assign.without_deleted.processed_pagination(params[:page])
  end

  def new
    @assign = Assign.new
  end

  def create
    @assign = current_user.assigns.new(assign_params)
    if @assign.save
      respond_to do |format|
        format.js
        format.html { redirect_to assigns_path }
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @assign.update(assign_params)
      redirect_to assigns_path
    else
      render :new
    end
  end

  def destroy
    if @assign.destroy
      respond_to do |format|
        format.js { redirect_to project_path(params[:project_id]) }
        format.html { redirect_to assigns_path }
      end
    end
  end

  def show; end

  def inactive
    @assigns = Assign.only_deleted.processed_pagination(params[:page])
  end

  def restore
    @assigns = Assign.only_deleted
    @assign = @assigns.find(params[:id])
    @assign.restore
    redirect_to inactive_assigns_path
  end

  private

  def assign_params
    params.require(:assign).permit(:user_id, :project_id, :billing_hours, :assigned_as, :employee_id)
  end

  def load_assign
    @assign = Assign.find(params[:id])
  end
end
