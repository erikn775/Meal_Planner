class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def edit
        @category = Category.find_by(id: params[:id])
    end

    def update
        @category = Category.find_by(id: params[:id])
        @category.update(category_params)
        redirect_to category_path(@category)
    end

    def destroy
        @category = Category.find_by(id: params[:id])
        @category.destroy
        redirect_to categories_path
    end

    private
    
    def category_params
        params.require(:category).permit(:name)
    end
end
