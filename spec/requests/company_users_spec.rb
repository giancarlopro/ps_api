require 'rails_helper'

RSpec.describe "CompanyUsers", type: :request do
  describe "GET /company_users" do
    it "works! (now write some real specs)" do
      get company_users_path
      expect(response).to have_http_status(200)
    end
  end
end
