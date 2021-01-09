class MealPlansController < ApplicationController
    include ApplicationHelper
    before_action :require_login

    def new
        @meal_plan = MealPlan.new
        
    end
    
    def create
        @meal_plan = current_user.meal_plans.new(meal_plan_params)
        @meal_plan.shopping_list = list_helper(@meal_plan)
        if @meal_plan.save
            redirect_to account_path(@meal_plan)
        else
            @errors = @meal_plan.errors.full_messages.join(" - ")
            render :new
        end 
    end

    def show
        @meal_plan = MealPlan.find_by(id: params[:id])
    end

    def shopping_list
        @meal_plan = current_user.meal_plans
    end

    def destroy
        @meal_plan = MealPlan.find_by(id: params[:id])
        @meal_plan.delete
        redirect_to account_path
    end

    private

    def meal_plan_params
        params.require(:meal_plan).permit(:week_of, :user_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end
end
