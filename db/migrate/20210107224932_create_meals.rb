class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plan do |t|
      t.string :week_of
      t.integer :user_id

      t.timestamps
    end
  end
end
