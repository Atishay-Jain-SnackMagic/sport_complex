class Sport < ApplicationRecord
  has_many :sports_locations, dependent: :destroy
end
