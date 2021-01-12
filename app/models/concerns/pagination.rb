# frozen_string_literal: true

# module
module Pagination
  include ActiveSupport::Concern

  @@per_page = 9

  def processed_pagination(page_no)
    paginate(page: page_no, per_page: @@per_page)
  end
end
