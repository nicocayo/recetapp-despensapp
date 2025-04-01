class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :products, through: :ingredients
  has_many :meals
  has_many :meal_plans, through: :meals

  validates :name, presence: true
  validates :instructions, presence: true

  def can_be_made_with_current_stock?
    ingredients.all? { |ingredient| ingredient.product.quantity >= ingredient.quantity }
  end

  def missing_ingredients
    ingredients.reject { |ingredient| ingredient.product.quantity >= ingredient.quantity }
  end
end
