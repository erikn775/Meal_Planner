class IngredientsController < ApplicationController

    def new
        @ingredient = Ingredient.new
        @ingredient.build_recipe
    end
    
    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            
        else
            render :new
        end
    end
    
    private
    
    
end
