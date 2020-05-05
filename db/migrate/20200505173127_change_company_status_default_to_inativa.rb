class ChangeCompanyStatusDefaultToInativa < ActiveRecord::Migration[6.0]
  def change
    change_column_default :companies, :status, from: '', to: 'inativa'
  end
end
