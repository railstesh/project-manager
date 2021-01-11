# frozen_string_literal: true

# class
class Assign < ApplicationRecord
  extend Pagination
  include Duration

  after_create :assign_user
  after_destroy :release_user

  acts_as_paranoid

  belongs_to :project
  belongs_to :user
  belongs_to :employee

  enum assigned_as: { Trainee: 0, Developer: 1, Helping_hand: 2, Lead: 3, Manager: 4 }

  validates_presence_of :project_id, :employee_id, :billing_hours, message: "This field shouldn't be blank"

  def update_status(employee, status)
    employee.update(status: status)
  end

  def assign_user
    self.update_status(self.employee, 'Engage')
    self.project.descriptions.create(title: "#{self.project.title} is assign to #{self.employee.name} as #{self.assigned_as}")
  end

  def release_user
    self.project.descriptions.create(title: "#{self.employee.name} is removed from #{self.project.title}")
    count = Assign.where(employee_id: self.employee_id).count
    self.update_status(self.employee, 'Available') if count == 0
  end
end
