class Cat < ApplicationRecord
  belongs_to :color
  belongs_to :breed
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 50}
  validates :age, numericality:  { only_integer: true, less_than_or_equal_to: 20}
  validates :color_id, presence: true, numericality: { only_integer: true}
  validates :color_id, presence: true, numericality: { only_integer: true}
  validates :breed_id, presence: true, numericality: {only_integer: true}
end
