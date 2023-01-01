class RecipeIngredientObject
  attr_reader :ingredients

  def initialize(attributes)
    @ingredients = attributes[:recipe][:ingredientLines]
  end
end