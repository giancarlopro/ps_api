module Admin
  class CompanyUsersController < ApplicationController
    before_action :set_company_user, only: [:show, :edit, :update, :destroy]
    before_action :set_company

    # GET /company_users
    # GET /company_users.json
    def index
      @company_users = CompanyUser.where(company: @company)
    end

    # GET /company_users/1
    # GET /company_users/1.json
    def show
    end

    # GET /company_users/new
    def new
      @company_user = CompanyUser.new
    end

    # GET /company_users/1/edit
    def edit
    end

    # POST /company_users
    # POST /company_users.json
    def create
      @company_user = CompanyUser.new(company_user_params)

      respond_to do |format|
        if @company_user.save
          format.html { redirect_to [:admin, @company, @company_user], notice: 'Company user was successfully created.' }
          format.json { render :show, status: :created, location: @company_user }
        else
          format.html { render :new }
          format.json { render json: @company_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /company_users/1
    # PATCH/PUT /company_users/1.json
    def update
      respond_to do |format|
        if @company_user.update(company_user_params)
          format.html { redirect_to [:admin, @company, @company_user], notice: 'Company user was successfully updated.' }
          format.json { render :show, status: :ok, location: @company_user }
        else
          format.html { render :edit }
          format.json { render json: @company_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /company_users/1
    # DELETE /company_users/1.json
    def destroy
      @company_user.destroy
      respond_to do |format|
        format.html { redirect_to admin_company_company_users_url, notice: 'Company user was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company_user
        @company_user = CompanyUser.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def company_user_params
        params.fetch(:company_user, {}).permit(:name, :email, :password, :request_change_password, :permission, :company_id)
      end

      def set_company
        @company = Company.find(params[:company_id])
      end
  end
end