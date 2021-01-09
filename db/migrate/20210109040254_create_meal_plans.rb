class CreateMealPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plans do |t|
      t.string :week_of
      t.string :shopping_list
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
      t.integer :user_id
      t.timestamps
    end
  end
end
