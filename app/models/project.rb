class Project < ApplicationRecord
  acts_as_paranoid
  
  has_many :assigns

  enum invoice_type: { Weekly: 0, Monthly: 1 }
  enum status: { Active: 0, Inactive: 1 }
end
