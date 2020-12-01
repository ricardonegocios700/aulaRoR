class CreateContactTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_types do |t|
      t.string  :description, null: false
      t.text    :note
      t.boolean :excluded, default: false

      t.timestamps
    end
  end
end
