class ImpoertRecipesJsonFile < ActiveRecord::Migration[6.1]
  def up
    data = []
    File.open('recipes.json').each_with_index do |line, index|
      data.push(JSON.parse(line).merge(created_at: Time.now, updated_at: Time.now))
    end

    Recipe.insert_all(data)
  end

  def down
    Recipe.destroy_all
  end
end
