# frozen_string_literal: true

# class
class Assign < ApplicationRecord
  extend Pagination

  acts_as_paranoid

  belongs_to :project
  belongs_to :user
  belongs_to :employee

  enum assigned_as: { Trainee: 0, Developer: 1, Helping_hand: 2, Lead: 3, Manager: 4 }

  validates_presence_of :project_id, :employee_id, :billing_hours, message: "This field shouldn't be blank"

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

  def update_status(employee_id, status)
    Employee.find(employee_id).update(status: status)
  end
end
