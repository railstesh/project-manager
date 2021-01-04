class Project < ApplicationRecord
  acts_as_paranoid
  
  has_many :assigns
  has_many :credientials
  has_many :descriptions, as: :descriptable
  belongs_to :profile

  enum invoice_type: { Weekly: 0, Monthly: 1 }

  accepts_nested_attributes_for :assigns, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title, :client_name, :profile_id, :work_limit, :technologies, message: "This field shouldn't be blank", on: :create
  validates_uniqueness_of :title, uniqueness: {case_sensitive: false}
end
