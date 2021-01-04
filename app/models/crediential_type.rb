class CredientialType < ApplicationRecord
  has_many :credientials

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
