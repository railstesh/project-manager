class HomeController < ApplicationController
  def index
    @assigns = Assign.without_deleted.paginate(page: params[:page], per_page: 9)
  end
end
