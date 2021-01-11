module Pagination
  include ActiveSupport::Concern

  def processed_pagination(page_no)
    paginate(page: page_no, per_page: 9)
  end
end