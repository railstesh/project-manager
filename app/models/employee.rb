class Employee < ApplicationRecord
  acts_as_paranoid
  
  has_many :assigns
  has_many :descriptions, as: :descriptable
end
