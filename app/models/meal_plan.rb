class MealPlan < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :recipes, through: :meals

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def duration_days
    (end_date - start_date).to_i + 1
  end

  def shopping_list
    # Calculate needed products based on planned meals
    needed_products = {}

    meals.includes(recipe: :ingredients).each do |meal|
      meal.recipe.ingredients.each do |ingredient|
        product_id = ingredient.product_id

        if needed_products[product_id]
          needed_products[product_id][:quantity] += ingredient.quantity
        else
          needed_products[product_id] = {
            product: ingredient.product,
            quantity: ingredient.quantity,
            unit: ingredient.unit
          }
        end
      end
    end

    # Subtract what's already in stock
    needed_products.each do |product_id, data|
      current_stock = data[:product].quantity
      needed_quantity = data[:quantity]

      if current_stock >= needed_quantity
        needed_products.delete(product_id)
      else
        data[:quantity] = needed_quantity - current_stock
      end
    end

    needed_products.values
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
