class AddCompanyToCompanyUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :company_users, :company, null: false, foreign_key: true
  end
end
