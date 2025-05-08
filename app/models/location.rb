class Location < ApplicationRecord
  has_one :address, as: :addressable, required: true, dependent: :destroy
  has_many :sports_locations, dependent: :destroy
  has_many :batches, through: :sports_locations

  validates :name, presence: true, uniqueness: { case_sensitive: false, allow_blank: true }
end
