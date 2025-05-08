class CreateSports < ActiveRecord::Migration[8.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.boolean :is_active, default: false, null: false

      t.timestamps
    end
  end
end
