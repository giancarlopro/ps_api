module Admin
  class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]
    before_action :set_categories, except: [:destroy]

    # GET /companies
    # GET /companies.json
    def index
      if params.has_key?(:q) and not params[:q].blank?
        @companies = Company.search(params[:q]).page params[:page]
      else
        @companies = Company.all.page params[:page]
      end
    end

    # GET /companies/1
    # GET /companies/1.json
    def show
    end

    # GET /companies/new
    def new
      @company = Company.new
    end

    # GET /companies/1/edit
    def edit
    end

    # POST /companies
    # POST /companies.json
    def create
      @company = Company.new(company_params)

      respond_to do |format|
        if @company.save
          format.html { redirect_to [:admin, @company], notice: 'Company was successfully created.' }
          format.json { render :show, status: :created, location: @company }
        else
          format.html { render :new }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /companies/1
    # PATCH/PUT /companies/1.json
    def update
      respond_to do |format|
        if @company.update(company_params)
          format.html { redirect_to [:admin, @company], notice: 'Company was successfully updated.' }
          format.json { render :show, status: :ok, location: @company }
        else
          format.html { render :edit }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /companies/1
    # DELETE /companies/1.json
    def destroy
      @company.destroy
      respond_to do |format|
        format.html { redirect_to admin_companies_url, notice: 'Company was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def company_params
        params.fetch(:company, {}).permit(:company_name, :fantasy_name, :email, :status, :logo, category_ids: [])
      end

      def set_categories
        @categories = Category.all
      end
  end
end