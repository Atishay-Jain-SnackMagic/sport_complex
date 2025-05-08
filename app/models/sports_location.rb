class SportsLocation < ApplicationRecord
  belongs_to :sport
  belongs_to :location

  validates :sport, uniqueness: { scope: :location }
end
