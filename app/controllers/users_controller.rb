class UsersController < ApplicationController
    include ApplicationHelper

    def new
        @user = User.new
    end
    
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to recipes_path
        else
            @errors = user.errors.full_messages.join(" - ")
            render :new
        end
    end
    
    def show
        @user = User.find(session[:user_id])
        @recipes = current_user.recipes.all
        #binding.pry
    end

    def recipes
        @user = User.find(session[:user_id])
        @recipes = current_user.recipes.all
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
    end
end
