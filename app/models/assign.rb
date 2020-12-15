class Assign < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :employee
end
