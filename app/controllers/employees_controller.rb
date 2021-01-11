# frozen_string_literal: true

# class
class EmployeesController < ApplicationController
  before_action :load_employee, only: %i[edit update destroy show]

  def index
    @employees = Employee.without_deleted.processed_pagination(params[:page])
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
    redirect_to employees_path
  end

  def show; end

  def inactive
    @employees = Employee.only_deleted.paginate(page: params[:page], per_page: 9)
  end

  def restore
    @employees = Employee.only_deleted
    @employee = @employees.find(params[:id])
    @employee.restore
    redirect_to inactive_employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :stack, skills: [])
  end

  def load_employee
    @employee = Employee.find(params[:id])
  end
end
