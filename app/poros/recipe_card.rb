class RecipeCard
  attr_reader :title, :image

  def initialize(attributes)
    @title = attributes[:recipe][:label]
    @image = attributes[:recipe][:image]
  end
end