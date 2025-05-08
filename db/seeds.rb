# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ 'Cricket', 'Tennis', 'Badminton', 'Squash', 'Table tennis' ].each do |sport|
  Sport.find_or_create_by(name: sport, is_active: true)
end

Location.find_or_create_by(name: 'A', address: Address.find_or_create_by(address: 'A', city: 'B', country: 'C', pincode: 'D'))
Location.find_or_create_by(name: 'B', address: Address.find_or_create_by(address: 'A', city: 'B', country: 'C', pincode: 'D'))

Sport.all.each do |sport|
  SportsLocation.find_or_create_by(sport: sport, location: Location.first, is_active: true)
  SportsLocation.find_or_create_by(sport: sport, location: Location.second, is_active: true)
end

SportsLocation.all.each do |sl|
  Batch.find_or_create_by(sports_location: sl, start_time: Time.now, end_time: 1.hours.from_now, amount: 1000)
end
