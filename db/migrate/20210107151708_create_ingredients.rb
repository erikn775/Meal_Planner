class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.string :unit
      t.integer :recipe_id
      
      t.timestamps
    end
  end
end
