require 'rails_helper'

RSpec.describe "company_users/index", type: :view do
  before(:each) do
    assign(:company_users, [
      CompanyUser.create!(),
      CompanyUser.create!()
    ])
  end

  it "renders a list of company_users" do
    render
  end
end
