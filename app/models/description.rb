# frozen_string_literal: true

# class
class Description < ApplicationRecord
  belongs_to :descriptable, polymorphic: true
end
