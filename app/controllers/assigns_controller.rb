class AssignsController < ApplicationController
  before_action :load_assign, only: %i[edit update destroy show]

  def index
    if params[:data] == 'active'
      @assigns = Assign.all.where(status: 0)
    else
      @assigns = Assign.all.where(status: 1)
    end
  end

  def new
    @assign = Assign.new
  end

  def create
    @assign = current_user.assigns.new(assign_params)
    if @assign.save
      redirect_to assigns_path
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
    @assign.update(status: 1)
    redirect_to assigns_path
  end

  def show; end

  protected

  def assign_params
    params.require(:assign).permit(:user_id, :project_id, :assigned, :billing_hours, :assigned_as, :status, :active_discription, :inactive_discription, :employee_id)
  end

  def load_assign
    @assign = Assign.find(params[:id])
  end
end
