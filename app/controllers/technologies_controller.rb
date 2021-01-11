# frozen_string_literal: true

# class
class TechnologiesController < ApplicationController
  before_action :load_technology, only: %i[edit update destroy show]

  def index
    @technologies = Technology.all.paginate(page: params[:page], per_page: 9)
  end

  def new
    @technology = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      respond_to do |format|
        format.js
        format.html { redirect_to technologies_path }
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @technology.update(technology_params)
      redirect_to technologies_path
    else
      render :new
    end
  end

  def destroy
    @technology.destroy
    redirect_to technologies_path
  end

  def show; end

  private

  def technology_params
    params.require(:technology).permit(:name)
  end

  def load_technology
    @technology = Technology.find(params[:id])
  end
end
