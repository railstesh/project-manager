# frozen_string_literal: true

# class
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :root_controller?

  def after_sign_in_path_for(*)
    root_path
  end

  def after_sign_out_path_for(*)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role name])
  end

  def root_controller?
    controller_name == root_path.split('/').first
  end
end
