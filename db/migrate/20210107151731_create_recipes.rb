class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.integer :category_id
      t.integer :meal_plan_id
      t.timestamps
    end
  end
end
