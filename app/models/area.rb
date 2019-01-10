class Area < ApplicationRecord
  belongs_to :travel, inverse_of: :areas
end
