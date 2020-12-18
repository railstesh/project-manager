class Description < ApplicationRecord
  belongs_to :descriptable, polymorphic: true
end
