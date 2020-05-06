require 'rails_helper'

RSpec.describe "company_users/show", type: :view do
  before(:each) do
    @company_user = assign(:company_user, CompanyUser.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
