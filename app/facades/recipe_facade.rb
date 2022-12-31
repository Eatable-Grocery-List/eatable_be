class RecipeFacade

  def self.get_40_recipes(searched_recipe)
    recipe_data = RecipeService.get_40_recipes(searched_recipe)
    recipe_data[:hits].map do |data|
      RecipeCard.new(data)
    end
  end

end