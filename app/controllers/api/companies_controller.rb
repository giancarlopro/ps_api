class Api::CompaniesController < ApplicationController
  def index
    if params.has_key?(:q) and not params[:q].blank?
      @companies = Company.search(params[:q])
    else
      @companies = Company.all
    end

    render json: @companies
  end

  def show
    @company = Company.find(params[:id])

    render json: @company
  end
end
