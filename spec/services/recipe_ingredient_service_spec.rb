require 'rails_helper'

RSpec.describe RecipeIngredientService do
  describe 'Edamam API endpoint' do
    it 'can retrieve data from the edemam endpoint and contains expected keys' do
      WebMock.allow_net_connect!
      VCR.turn_off!
      ingredients = RecipeIngredientService.get_all_ingredients('Couscous, Mediteranian Salad') 
      expect(ingredients).to be_a(Hash)
      expect(ingredients).to have_key(:hits)
      expect(ingredients[:hits]).to be_an(Array)
      expect(ingredients[:hits].first).to be_a(Hash)
      expect(ingredients[:hits].first[:recipe]).to have_key(:ingredientLines)
      expect(ingredients[:hits].first[:recipe][:ingredientLines]).to be_an(Array)
      expect(ingredients[:hits].first[:recipe][:ingredientLines]).to all(be_a(String))
    end
  end
end
