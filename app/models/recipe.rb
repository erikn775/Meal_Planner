class Recipe < ApplicationRecord
    has_many :ingredients
    accepts_nested_attributes_for :ingredients, reject_if: proc { |att| att['name'].blank? }
    
end
