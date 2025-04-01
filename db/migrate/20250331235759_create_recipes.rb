class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.integer :cooking_time
      t.integer :servings

      t.timestamps
    end
  end
end
