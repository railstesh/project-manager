class EmployeesController < ApplicationController
  before_action :load_employee, only: %i[edit update destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params) 

    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :new
    end
  end

  def destroy
    @employee.destroy
  end

  protected

  def employee_params
    params.require(:employee).permit(:name, :email, :stack, :skills)
  end

  def load_employee
    @employee = Employee.find(params[:id])
  end
end
