class RecipeIngredientService

  def self.get_all_ingredients(recipe_name)
    response = conn.get("/search?q=#{recipe_name}") do |req|
      req.params[:app_id] = "#{ENV['edamam_app_key']}"
      req.params[:app_key] = "#{ENV['edamam_api_key']}"
    end
    
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new("https://api.edamam.com")
  end

end