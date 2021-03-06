# frozen_string_literal: true

# class
class Profile < ApplicationRecord
  extend Pagination

  has_many :projects

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
