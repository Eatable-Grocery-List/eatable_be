require 'rails_helper'

RSpec.describe RecipeService do
  describe 'API endpoint' do
    it 'can retrieve data from the edemam endpoint and contains expected keys' do
      json_response = File.read('spec/fixtures/responses/recipes_search_pasta.json')
      stub_request(:get, "https://api.edamam.com/search?q=pasta&app_id=#{ENV['edamam_app_key']}&app_key=#{ENV['edamam_api_key']}")
        .to_return(status: 200, body: json_response, headers: {})
      
      recipes = RecipeService.get_40_recipes('pasta') 

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:q)
      expect(recipes[:q]).to eq("pasta")

      expect(recipes).to have_key(:hits)
      expect(recipes[:hits].size).to eq(10)

      recipes[:hits].each do |recipe_info|
        expect(recipe_info[:recipe]).to have_key(:label)
        expect(recipe_info[:recipe]).to have_key(:image)
        expect(recipe_info[:recipe][:label]).to be_a(String)
        expect(recipe_info[:recipe][:image]).to be_a(String)
      end
    end
  end
end
