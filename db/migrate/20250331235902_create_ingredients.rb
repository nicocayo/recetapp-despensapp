class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.references :product, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.decimal :quantity
      t.string :unit
      t.text :notes

      t.timestamps
    end
  end
end
