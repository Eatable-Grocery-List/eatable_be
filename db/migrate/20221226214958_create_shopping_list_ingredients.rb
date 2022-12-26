class CreateShoppingListIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_list_ingredients do |t|
      t.references :ingredient, foreign_key: true
      t.references :shopping_list, foreign_key: true
      t.boolean :in_cart

      t.timestamps
    end
  end
end
