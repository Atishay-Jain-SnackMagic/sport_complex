class CreateEnrolments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrolments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.belongs_to :batch, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
