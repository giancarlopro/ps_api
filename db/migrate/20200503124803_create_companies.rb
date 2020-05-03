class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :fantasy_name
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
