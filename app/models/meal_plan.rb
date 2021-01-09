class MealPlan < ApplicationRecord
    belongs_to :user
    has_many :recipes, through: :planners
    has_many :ingredients, through: :recipes
end
