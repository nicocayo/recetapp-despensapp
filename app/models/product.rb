class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :ingredients
  has_many :recipes, through: :ingredients

  validates :name, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :in_stock, -> { where("quantity > 0") }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :expiring_soon, -> { where("expiration_date <= ?", 7.days.from_now) }

  def enough_for_recipe?(recipe)
    recipe.ingredients.each do |ingredient|
      return false if ingredient.product_id == self.id && self.quantity < ingredient.quantity
    end
    true
  end
end
