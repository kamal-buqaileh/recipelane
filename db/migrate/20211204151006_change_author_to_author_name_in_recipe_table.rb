class ChangeAuthorToAuthorNameInRecipeTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :author, :author_name
  end
end
