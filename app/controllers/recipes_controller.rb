class RecipesController < ApplicationController
  load_and_authorize_resource only: %i[index show]

  def index
    if params[:recipe].present? && params[:recipe][:any_ingredients].present?
      args = params[:recipe][:any_ingredients]
      args.gsub!("'", "''")
      @recipes = Recipe.where("array_to_string(ingredients, ', ') like '%#{args}%'")
    elsif params[:recipe].present? && params[:recipe][:full_ingredients].present?
      args = params[:recipe][:full_ingredients].split(', ')
      @recipes = Recipe.where('ingredients @> ARRAY[?]::Text[]', args)
    end
    @recipes = @recipes.page params[:page]
  end
end
