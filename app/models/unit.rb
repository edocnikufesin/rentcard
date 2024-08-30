class Unit < ApplicationRecord
  has_many :rates
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 3 }
end
