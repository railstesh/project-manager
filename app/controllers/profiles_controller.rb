# frozen_string_literal: true

# class
class ProfilesController < ApplicationController
  before_action :load_profile, only: %i[edit update destroy show]

  def index
    @profiles = Profile.all.paginate(page: params[:page], per_page: 9)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      respond_to do |format|
        format.js
        format.html { redirect_to profiles_path }
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render :new
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  def show; end

  protected

  def profile_params
    params.require(:profile).permit(:name)
  end

  def load_profile
    @profile = Profile.find(params[:id])
  end
end
