class Api::V1::RecipesController < ApplicationController  

  def search
    searched_recipe = params[:search]
    recipe_information = RecipeFacade.get_40_recipes(searched_recipe)
    render json: serialize_recipes(searched_recipe, recipe_information)
  end

  private
  def serialize_recipes(searched_recipe, recipe_information)
    RecipeSerializer.serialize_recipes(searched_recipe, recipe_information)
  end
end