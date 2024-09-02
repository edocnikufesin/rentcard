class Unit < ApplicationRecord
  has_one :rate, dependent: :destroy
  accepts_nested_attributes_for :rate, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 3 }
end
