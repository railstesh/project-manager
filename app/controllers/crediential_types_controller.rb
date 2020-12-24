class CredientialTypesController < ApplicationController
  before_action :load_type, only: %i[edit update destroy show]

  def index
    @crediential_types = CredientialType.all.paginate(page: params[:page], per_page: 9)
  end

  def new
    @crediential_type = CredientialType.new
  end

  def create
    @crediential_type = CredientialType.new(crediential_type_params) 

    if @crediential_type.save
      redirect_to crediential_types_path
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
    @crediential_type.destroy
  end

  def show; end

  protected

  def crediential_type_params
    params.require(:crediential_type).permit(:name)
  end

  def load_type
    @crediential_type = CredientialType.find(params[:id])
  end
end
