class HomeController < ApplicationController
  def index
  	@assigns = Assign.all
  end
end
