class Api::CompaniesController < ApplicationController
  def index
    if params.has_key?(:q) and not params[:q].blank?
      @companies = Company.search(params[:q])
    else
      @companies = Company.all
    end

    render 'api/companies/index.json'
  end

  def show
    @company = Company.find(params[:id])

    render 'api/companies/show.json'
  end
end
