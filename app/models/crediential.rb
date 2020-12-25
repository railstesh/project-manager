class Crediential < ApplicationRecord
  belongs_to :crediential_type
  belongs_to :project
end
