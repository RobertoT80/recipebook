class AddRatingToRecipe < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :rating, :string
  end
end
