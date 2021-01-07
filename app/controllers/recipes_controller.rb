class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
        binding.pry
    end
    
    def new
        @recipe = Recipe.new
        2.times {@recipe.ingredients.build}
        
    end
    
    def create
        
        @recipe = Recipe.create(recipe_params)
            redirect_to recipe_path(@recipe)
    
    end

    def show
        @recipe = Recipe.find(params[:id])
    end
    
    def edit
    
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit(:name, ingredients_attributes: [:name, :quantity, :unit])
    end

    # def ingredient_params
    #     params.require(:ingredients).permit(:name, :quantity, :unit, :recipe)
    # end
end
