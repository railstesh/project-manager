# frozen_string_literal: true

# class
class Technology < ApplicationRecord
  has_many :projects

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
