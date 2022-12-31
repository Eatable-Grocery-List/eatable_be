class ShoppingListIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :shopping_list
end
