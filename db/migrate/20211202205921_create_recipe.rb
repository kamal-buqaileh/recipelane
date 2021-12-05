class CreateRecipe < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.index :name

      t.string :author_tip
      t.string :budget
      t.string :cook_time
      t.string :prep_time
      t.string :total_time
      t.string :difficulty
      t.string :image
      t.string :author

      t.text :ingredients, array: true, default: []
      t.index :ingredients

      t.text :tags,        array: true, default: []

      t.integer :nb_comments
      t.integer :people_quantity

      t.float :rate

      t.timestamps
    end
  end
end
