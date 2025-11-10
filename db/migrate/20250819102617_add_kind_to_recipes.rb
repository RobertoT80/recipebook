class AddKindToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :kind, :string
  end
end
