class Api::V1::ShoppingListIngredientsController < ApplicationController  

  def search
    recipe_name = params[:recipe_name]
    ingredients_information = RecipeIngredientsFacade.get_all_ingredients(recipe_name)
    render json: serialize_recipe_ingredients(recipe_name, ingredients_information)
  end

  private
  def serialize_recipe_ingredients(recipe_name, ingredients_information)
    RecipeIngredientsSerializer.serialize_recipe_ingredients(recipe_name, ingredients_information)
  end
end