class AddIndexToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_index :recipes, :title, unique: true
  end
end
