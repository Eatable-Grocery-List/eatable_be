class RecipeIngredientsSerializer

  def self.serialize_recipe_ingredients(recipe_name, ingredients_information)
    {
      data:
        {
          id: Time.now,
          type: "recipeIngredients",
          attributes: {
            title: recipe_name,
            ingredients: ingredients_information.ingredients
          }
        }
    }
  end
end