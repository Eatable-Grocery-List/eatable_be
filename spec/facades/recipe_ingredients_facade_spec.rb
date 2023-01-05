require 'rails_helper'

RSpec.describe 'recipe ingredients facade' do
  it 'I can see all ingredients associated with a recipe & turn them into recipe objects' do
    json_response = File.read('spec/fixtures/responses/ingredient_search_couscous_mediteranian_salad.json')
    stub_request(:get, "https://api.edamam.com/search?q=Couscous, Mediteranian Salad&app_id=#{ENV['edamam_app_key']}&app_key=#{ENV['edamam_api_key']}")
      .to_return(status: 200, body: json_response, headers: {})
    
    ingredients = RecipeIngredientsFacade.get_all_ingredients('Couscous, Mediteranian Salad')
    expect(ingredients.ingredients).to be_an(Array)
    expect(ingredients.ingredients).to all(be_a(String))
    expect(ingredients).to be_a(RecipeIngredientObject)
  end
end