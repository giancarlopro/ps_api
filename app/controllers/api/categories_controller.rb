class Api::CategoriesController < ApplicationController
  def index
    if params.has_key?(:q) and not params[:q].blank?
      @categories = Category.search(params[:q])
    else
      @categories = Category.all
    end

    render json: @categories
  end

  def show
    @category = Category.find(params[:id])

    render json: @category
  end
end
