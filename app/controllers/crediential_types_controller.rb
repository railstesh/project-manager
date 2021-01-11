# frozen_string_literal: true

# class
class CredientialTypesController < ApplicationController
  before_action :load_type, only: %i[edit update destroy show]

  def index
    @crediential_types = CredientialType.all.processed_pagination(params[:page])
  end

  def new
    @crediential_type = CredientialType.new
  end

  def create
    @crediential_type = CredientialType.new(crediential_type_params)

    if @crediential_type.save
      respond_to do |format|
        format.js
        format.html { redirect_to crediential_types_path }
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @crediential_type.update(crediential_type_params)
      redirect_to crediential_types_path
    else
      render :new
    end
  end

  def destroy
    redirect_to crediential_types_path if @crediential_type.destroy
  end

  def show; end

  private

  def crediential_type_params
    params.require(:crediential_type).permit(:name)
  end

  def load_type
    @crediential_type = CredientialType.find(params[:id])
  end
end
