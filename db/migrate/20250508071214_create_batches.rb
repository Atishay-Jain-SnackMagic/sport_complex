class CreateBatches < ActiveRecord::Migration[8.0]
  def change
    create_table :batches do |t|
      t.belongs_to :sports_location, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.integer :amount

      t.timestamps
    end
  end
end
