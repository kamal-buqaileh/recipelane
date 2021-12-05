class LinkRecipeAndAuthorTables < ActiveRecord::Migration[6.1]
  def up
    data = Recipe.all.group_by(&:author_name)

    data.each do |author_name, recipes|
      author = Author.create(name: author_name)

      recipes.map{ |recipe| recipe.update(author_id: author.id) }
    end
  end

  def down
    Recipe.update_all(author: nil)
    Author.destroy_all
  end
end
