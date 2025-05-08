class Batch < ApplicationRecord
  belongs_to :sports_location
  has_many :enrolments, dependent: :destroy

  validates :amount, :start_time, :end_time, presence: true

  validates :amount, numericality: { only_integer: true, greater_than: 0, allow_blank: true }
end
