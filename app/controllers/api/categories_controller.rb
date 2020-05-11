class Api::CategoriesController < ApplicationController
  def index
    if params.has_key?(:q) and not params[:q].blank?
      @categories = Category.search(params[:q])
    else
      @categories = Category.all
    end

    render 'api/categories/index.json'
  end

  def show
    @category = Category.find(params[:id])

    render 'api/categories/show.json'
  end
end
