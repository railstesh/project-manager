# frozen_string_literal: true

# class
class Project < ApplicationRecord
  extend Pagination
  include Duration

  after_create :project_create

  acts_as_paranoid

  has_many :assigns
  has_many :credientials
  has_many :descriptions, as: :descriptable
  belongs_to :profile

  enum invoice_type: { Weekly: 0, Monthly: 1 }

  validates_presence_of :title, :client_name, :profile_id, :work_limit, :technologies, on: :create
  validates_uniqueness_of :title, uniqueness: { case_sensitive: false }

  def project_create
    descriptions.create(title: "#{title} is created on #{created_at.strftime("%Y-%m-%d, %I:%M:%S %p")}")
  end
end
