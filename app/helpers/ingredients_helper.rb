module IngredientsHelper
    def plural(ingredient)
        if ingredient.quantity.to_i > 1
            ingredient.name.pluralize
        else
            ingredient.name
        end
    end
end
