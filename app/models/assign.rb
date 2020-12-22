class Assign < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :project
  belongs_to :user
  belongs_to :employee

  enum assigned_as: { Trainee: 0, Developer: 1, Helping_hand: 2, Lead: 3, Manager: 4 }
end
