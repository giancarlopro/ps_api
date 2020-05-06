class Category < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, 
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }

  has_one_attached :image

  has_and_belongs_to_many :companies

  validates :name, presence: true
end
