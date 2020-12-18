class Employee < ApplicationRecord
  acts_as_paranoid
  
  has_many :assigns
end
