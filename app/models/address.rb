class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :address, :city, :country, :pincode, presence: true
end
