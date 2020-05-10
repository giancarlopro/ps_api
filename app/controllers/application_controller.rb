class ApplicationController < ActionController::Base
  before_action :request_change_password?
  
  def request_change_password?
    if current_company_user and current_company_user.request_change_password
      redirect_to edit_company_users_path
    end
  end
end
