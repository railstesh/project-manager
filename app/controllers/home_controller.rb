class HomeController < ApplicationController
  def index
    @assigns = Assign.without_deleted
  end
end
