class Lost < ApplicationRecord
  validates :current_location, presence: true
end
