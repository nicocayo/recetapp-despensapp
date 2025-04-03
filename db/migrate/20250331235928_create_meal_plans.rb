class CreateMealPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :meal_plans do |t|
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
