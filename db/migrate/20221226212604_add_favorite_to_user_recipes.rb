class AddFavoriteToUserRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :user_recipes, :favorite, :boolean
  end
end
