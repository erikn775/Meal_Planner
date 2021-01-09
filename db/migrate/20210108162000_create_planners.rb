class CreatePlanners < ActiveRecord::Migration[6.1]
  def change
    create_table :planners do |t|
      t.integer :recipe_id
      t.integer :meal_plan_id
      t.timestamps
    end
  end
end
