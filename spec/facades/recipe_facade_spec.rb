require 'rails_helper'

RSpec.describe 'recipe facade' do
  it 'I can see all expected attributes of the recipe & turn them into recipe objects' do
    json_response = File.read('spec/fixtures/responses/recipes_search_pasta.json')
    stub_request(:get, "https://api.edamam.com/search?q=pasta&app_id=#{ENV['edamam_app_key']}&app_key=#{ENV['edamam_api_key']}")
      .to_return(status: 200, body: json_response, headers: {})
    
    recipes = RecipeFacade.get_40_recipes('pasta')
    expect(recipes).to be_an(Array)
    expect(recipes.size).to eq(10)
    expect(recipes).to all(be_a(RecipeCard))
  end
end