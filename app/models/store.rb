class Store < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: true, presence: true
  validates :category, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :crypto, presence: true

  include PgSearch
  pg_search_scope :search, against: [:name, :category, :address, :postcode]
end
