class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

 def index
 if params[:sort].present? && params[:direction].present?
    @recipes = @recipes.order("#{params[:sort]} #{params[:direction]}")
 end


    if params[:kind].present?
      @recipes = Recipe.where(kind: params[:kind])
    else
      @recipes = Recipe.all
    end
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

def destroy
  @recipe.destroy
  redirect_to recipes_path

end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_recipe
     @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.expect(recipe: [ :name, :kind, :author, :source, :rating, :description, :featured_image ])
    end
end
