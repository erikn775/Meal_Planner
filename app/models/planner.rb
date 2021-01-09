class Planner < ApplicationRecord
    belongs_to :recipes
    belongs_to :meal_plans
end
