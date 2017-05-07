require "search_api_wrapper"

class RecipesController < ApplicationController

  def index

      if params[:q]
        @recipes = SearchApiWrapper.listRecipes(params[:q])
        @recipes_pages = @recipes.paginate(:page => params[:page], :per_page => 10)

        if @recipes == []
          flash[:error] = "Sorry, there is no match"
          redirect_to root_path
        end
      end
  end

  def show
    @recipe = SearchApiWrapper.showRecipe(params[:uri])
  end
end
