class RecipeSerializer

  def self.serialize_recipes(searched_recipe, recipe_information)
    {
      data:
      recipe_information.map do |recipe|
        {
          id: "null",
          type: "recipe",
          attributes: {
            title: recipe.title,
            image: recipe.image,
          }
        }
      end
    }
  end
end