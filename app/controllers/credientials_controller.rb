# frozen_string_literal: true

# class
class CredientialsController < ApplicationController
  before_action :load_crediential, only: %i[edit update destroy show]

  def index
    @credientials = Crediential.all.processed_pagination(params[:page])
  end

  def new
    @crediential = Crediential.new
    @crediential_type = CredientialType.new
  end

  def create
    @crediential = Crediential.new(crediential_params)

    if @crediential.save
      respond_to do |format|
        format.js
        format.html { redirect_to credientials_path }
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @crediential.update(crediential_params)
      redirect_to credientials_path
    else
      render :new
    end
  end

  def destroy
    if @crediential.destroy
      respond_to do |format|
        format.js { redirect_to project_path(params[:project_id]) }
        format.html { redirect_to credientials_path }
      end
    end
  end

  def show; end

  private

  def crediential_params
    params.require(:crediential).permit(:url, :username, :email, :password, :project_id, :crediential_type_id)
  end

  def load_crediential
    @crediential = Crediential.find(params[:id])
  end
end
