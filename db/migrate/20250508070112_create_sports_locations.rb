class CreateSportsLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :sports_locations do |t|
      t.belongs_to :sport, null: false, foreign_key: true
      t.belongs_to :location, null: false, foreign_key: true
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
