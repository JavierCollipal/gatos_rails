class Cat < ApplicationRecord
  validates :name, presence: true, length: { in: 5..200 }, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 100 }
end
