class RecipesController < ApplicationController
    include ApplicationHelper
    before_action :require_login

    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
        10.times {@recipe.ingredients.build}
    end
    
    def create
        @recipe = current_user.recipes.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            @errors = @recipe.errors.full_messages.join(" - ")
            render :new
        end 
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
        
    end
    
    def edit
        @recipe = Recipe.find_by(id: params[:id])
    end

    def update
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    def destroy
        
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit(:name, :category_id, :user_id, ingredients_attributes: [:name, :quantity, :unit])
    end

end
