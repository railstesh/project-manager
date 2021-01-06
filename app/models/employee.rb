class Employee < ApplicationRecord
  acts_as_paranoid
  
  has_many :assigns
  has_many :descriptions, as: :descriptable

  enum status: { Available: 0, Engage: 1, Training: 2, Working_on_demo: 3 }

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, uniqueness: true, format: { with: Devise::email_regexp } 

  def name_with_status
    "#{name} (#{status})"
  end
end
