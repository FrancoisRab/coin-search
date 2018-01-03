class Store < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  include PgSearch
  pg_search_scope :search, against: [:name, :category, :address, :postcode]
end
