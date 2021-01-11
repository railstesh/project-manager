# frozen_string_literal: true

# class
class Project < ApplicationRecord
  acts_as_paranoid

  has_many :assigns
  has_many :credientials
  has_many :descriptions, as: :descriptable
  belongs_to :profile

  enum invoice_type: { Weekly: 0, Monthly: 1 }

  accepts_nested_attributes_for :assigns, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title, :client_name, :profile_id, :work_limit, :technologies, on: :create
  validates_uniqueness_of :title, uniqueness: { case_sensitive: false }

  def calculate_time
    date1 = self.created_at.to_date
    date2 = DateTime.now.to_date
    date = date_diff(date1, date2)
    "#{date.first} years, #{date.second} months"
  end

  def date_diff(date1, date2)
    month = (date2.year * 12 + date2.month) - (date1.year * 12 + date1.month)
    month.divmod(12)
  end
end
