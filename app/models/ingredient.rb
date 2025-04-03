class Ingredient < ApplicationRecord
  belongs_to :product
  belongs_to :recipe

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :unit, presence: true

  def sufficient_quantity_available?
    product.quantity >= quantity
  end
end
