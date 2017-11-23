class Lost < ApplicationRecord
  has_one :property
  validates :current_location, presence: true
end
