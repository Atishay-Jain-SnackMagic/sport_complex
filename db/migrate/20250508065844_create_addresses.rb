class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :country
      t.string :pincode
      t.belongs_to :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
