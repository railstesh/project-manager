# frozen_string_literal: true

# class
class CredientialType < ApplicationRecord
  extend Pagination

  has_many :credientials

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
