# frozen_string_literal: true

# class
class HomeController < ApplicationController
  def index
    @projects = Project.without_deleted.processed_pagination(params[:page])
  end
end
