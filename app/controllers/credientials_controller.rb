class CredientialsController < ApplicationController
  before_action :load_crediential, only: %i[edit update destroy show]

  def index
    @credientials = Crediential.all.paginate(page: params[:page], per_page: 9)
  end

  def new
    @crediential = Crediential.new
    @crediential_type = CredientialType.new
  end

  def create
    @crediential = Crediential.new(crediential_params) 

    if @crediential.save
      redirect_to credientials_path
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
    @crediential.destroy
    redirect_to credientials_path
  end

  def show; end

  protected

  def crediential_params
    params.require(:crediential).permit(:url, :username, :email, :password, :project_id, :crediential_type_id)
  end

  def load_crediential
    @crediential = Crediential.find(params[:id])
  end
end
