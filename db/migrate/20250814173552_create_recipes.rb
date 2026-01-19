class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source
      t.string :author

      t.timestamps
    end
  end
end
