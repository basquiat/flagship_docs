class CategoriesController < ApplicationController

  # GET /categories
  def index
    @categories = Category.roots
  end

  def show
    @category = Category.find params[:id]
  end

end