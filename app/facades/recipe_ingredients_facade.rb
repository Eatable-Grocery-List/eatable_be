class RecipeIngredientsFacade

  def self.get_all_ingredients(recipe_name)
    ingredients_data = RecipeIngredientService.get_all_ingredients(recipe_name)
      RecipeIngredientObject.new(ingredients_data[:hits].first)
  end
end