class CreateCompanyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :company_users do |t|
      t.string :name
      t.boolean :request_change_password

      t.timestamps
    end
  end
end
