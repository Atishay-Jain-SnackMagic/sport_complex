class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest, null: false
      t.boolean :is_admin, default: false, null: false
      t.index 'LOWER(email)', unique: true

      t.timestamps
    end
  end
end
