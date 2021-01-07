class CreateShoppings < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_list do |t|
      t.integer :meal_plan_id

      t.timestamps
    end
  end
end
