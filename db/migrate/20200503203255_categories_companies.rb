class CategoriesCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_companies, id: false do |t|
      t.belongs_to :category
      t.belongs_to :company
    end
  end
end
