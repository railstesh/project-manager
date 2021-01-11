# frozen_string_literal: true

# class
class Description < ApplicationRecord
  extend Pagination

  belongs_to :descriptable, polymorphic: true
end
