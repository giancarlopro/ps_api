require 'rails_helper'

RSpec.describe "company_users/edit", type: :view do
  before(:each) do
    @company_user = assign(:company_user, CompanyUser.create!())
  end

  it "renders the edit company_user form" do
    render

    assert_select "form[action=?][method=?]", company_user_path(@company_user), "post" do
    end
  end
end
