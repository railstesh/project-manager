class Project < ApplicationRecord
  acts_as_paranoid
  
  has_many :assigns
  has_many :descriptions, as: :descriptable
  belongs_to :profile
  belongs_to :technology

  enum invoice_type: { Weekly: 0, Monthly: 1 }

  accepts_nested_attributes_for :assigns, reject_if: :all_blank, allow_destroy: true
end
