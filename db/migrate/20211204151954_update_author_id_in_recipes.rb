class RemoveAuthorNameColumnFromRecipes < ActiveRecord::Migration[6.1]
  def up
    remove_column :recipes, :author_name
  end

  def down
    add_column :recipes, :author_name, :string

    Recipe.reset_column_information

    Author.all.each do |author|
      author.recipes.update_all(author_name: author.name)
    end
  end
end
