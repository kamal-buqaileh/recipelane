desc "Import data from recipes.json file"
task :import_recipes_json_file => :environment do

  def fetch_data
    data = []
    File.open('recipes.json').each_with_index do |line, index|
      data.push(JSON.parse(line).merge(created_at: Time.now, updated_at: Time.now))
    end
    data
  end

  data = fetch_data
  Recipe.insert_all(data)
end
