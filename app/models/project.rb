class Project < ApplicationRecord
  has_many :assigns

  enum invoice_type: { Weekly: 0, Monthly: 1 }
  enum status: { Active: 0, Inactive: 1 }
end
