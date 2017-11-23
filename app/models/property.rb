class Property < ApplicationRecord
  validates :name, presence: true
  validates :token, uniqueness: true, presence: true
  validates :is_lost, inclusion: { in: [true, false] }
end
