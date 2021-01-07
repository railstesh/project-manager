# frozen_string_literal: true

# class
class HomeController < ApplicationController
  def index
    @projects = Project.without_deleted.paginate(page: params[:page], per_page: 9)
  end
end
