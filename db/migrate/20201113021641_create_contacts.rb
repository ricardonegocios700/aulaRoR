class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string  :name, null: false
      t.string  :email
      t.string  :telephone
      t.string  :cell_phone
      t.integer :contact_type_id
      t.integer :person_id
      t.boolean :excluded

      t.timestamps
    end
  end
end
