class Store < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: true, presence: true
  validates :category, presence: true
  validates :postcode, presence: true
  validates :address, uniqueness: true, presence: true
  validates :crypto, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search, against: [:name,
                                     :category,
                                     :address,
                                     :postcode,
                                     :crypto,
                                     :description],
  using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }

  mount_uploader :photo, PhotoUploader
end
