class Fridge < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :drinks, dependent: :destroy
  validates :location, :brand, :size, presence: true
  # validates :foods, size: { is <= 10 }
  # validates :drinks, size: { is <= 50 ounces }
end
