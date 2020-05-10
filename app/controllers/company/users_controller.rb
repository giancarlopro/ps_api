class Company::UsersController < ApplicationController
  skip_before_action :request_change_password?

  def edit
    @user = current_company_user
  end

  def update_password
    @user = current_company_user

    @user.request_change_password = false

    if @user.update_with_password(user_params)
      bypass_sign_in(@user)

      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.fetch(:company_user, {}).permit(:current_password, :password, :password_confirmation)
    end
end
