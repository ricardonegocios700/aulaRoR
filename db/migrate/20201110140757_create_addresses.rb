class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :street, null: false
      t.string  :district
      t.string  :city
      t.string  :state
      t.string  :country
      t.string  :postal_code
      t.integer :type_address_id
      t.integer :person_id
      t.boolean :excluded, default: false
      
      t.timestamps
    end
  end
end
