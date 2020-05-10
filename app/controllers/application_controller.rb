class ApplicationController < ActionController::Base
  before_action :request_change_password?
  before_action :set_user
  
  protected
    def request_change_password?
      if current_company_user and current_company_user.request_change_password
        redirect_to edit_company_users_path
      end
    end

    def set_user
      @current_user = current_company_user || current_admin_user
    end
end
