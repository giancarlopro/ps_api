require 'rails_helper'

RSpec.describe "company_users/new", type: :view do
  before(:each) do
    assign(:company_user, CompanyUser.new())
  end

  it "renders new company_user form" do
    render

    assert_select "form[action=?][method=?]", company_users_path, "post" do
    end
  end
end
