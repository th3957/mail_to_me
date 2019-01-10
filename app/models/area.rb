class Area < ApplicationRecord
  FORM = 1
  belongs_to :travel, inverse_of: :areas
end
