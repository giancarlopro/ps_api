class Company < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, 
                  against: [:company_name, :fantasy_name, :email],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_one_attached :logo

  STATUS_OPTIONS = [['Ativa', 'ativa'], ['Inativa', 'inativa']]

  has_and_belongs_to_many :categories

  validates :company_name, presence: true
  validates :fantasy_name, presence: true
  validates :category_ids, presence: true
  validates :email, presence: true
  validates_email_format_of :email
end
