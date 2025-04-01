class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.string :unit
      t.date :expiration_date
      t.references :category, null: false, foreign_key: true
      t.text :notes
      t.string :flavor

      t.timestamps
    end
  end
end
