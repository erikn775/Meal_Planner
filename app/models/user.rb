class User < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes
    has_many :meal_plans
    has_secure_password
    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
end






#recipe has_many plans through meal_plan and meal_plan has_many plans through recipes
#shopping_list makes sense to be a view in meal_plan