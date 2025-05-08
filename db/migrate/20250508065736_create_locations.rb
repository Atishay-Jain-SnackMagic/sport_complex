class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :name, index: { unique: true }
      t.boolean :is_active, default: false, null: false

      t.timestamps
    end
  end
end
