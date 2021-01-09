class CreateMealPlanRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plan_recipes, id: false do |t|
      t.belongs_to :recipes
      t.belongs_to :meal_plans
      t.timestamps
    end
  end
end
