# frozen_string_literal: true

# class
class Crediential < ApplicationRecord
  extend Pagination

  belongs_to :crediential_type
  belongs_to :project
end
