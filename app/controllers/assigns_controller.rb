class AssignsController < ApplicationController
  before_action :load_assign, only: %i[edit update destroy]

  def index
    @assigns = Assign.all
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
    @assign.destroy
  end

  protected

  def assign_params
    params.require(:assign).permit(:user_id, :project_id, :assigned, :billing_hours)
  end

  def load_assign
    @assign = Assign.find(params[:id])
  end
end
