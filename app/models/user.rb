class User < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes
    has_many :meal_plan
    has_many :shopping_list, through: :meal_plan
end
