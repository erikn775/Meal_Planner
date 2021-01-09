class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients
    has_and_belongs_to_many :meal_plans
    accepts_nested_attributes_for :ingredients, reject_if: proc { |att| att['name'].blank? }
    validates :name, presence: true

    def logged_in?
        !!session[:user_id]
    end
  
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
