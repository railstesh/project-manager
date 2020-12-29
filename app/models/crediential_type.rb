class CredientialType < ApplicationRecord
  has_many :credientials

  validates :name, presence: true
end
