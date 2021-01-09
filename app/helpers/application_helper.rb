module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end
  
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authenication_required
        if !logged_in?
            redirect_to login_path
        end
    end
      
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def plural(ingredient)
        if ingredient.quantity.to_i > 1
            ingredient.name.pluralize
        else
            ingredient.name
        end
    end

    def is_empty?(meal_plan)
        if meal_plan.empty?
            link_to("Please add Meal Plan here", new_meal_plan_path)
        end
    end

    def meal_linker(meal_plan)
        recipe = Recipe.find_by(name: meal_plan)
        link_to(recipe.name, recipe_path(recipe))
    end

    def list_maker(meal_plan)
        recipe = Recipe.find_by(name: meal_plan)
    end

    def list_helper(meal_plan)
        shopping_list = [
            list_maker(meal_plan.monday).ingredients,
            list_maker(meal_plan.tuesday).ingredients,
            list_maker(meal_plan.wednesday).ingredients,
            list_maker(meal_plan.thursday).ingredients,
            list_maker(meal_plan.friday).ingredients,
            list_maker(meal_plan.saturday).ingredients,
            list_maker(meal_plan.sunday).ingredients
        ]
    end
end
