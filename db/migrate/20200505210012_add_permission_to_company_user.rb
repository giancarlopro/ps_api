class AddPermissionToCompanyUser < ActiveRecord::Migration[6.0]
  def change
    add_column :company_users, :permission, :string
  end
end
