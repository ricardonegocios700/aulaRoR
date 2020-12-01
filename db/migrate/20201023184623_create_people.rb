class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string  :name, null: false
      t.string  :nickname
      t.string  :email
      t.string  :telephone
      t.string  :rg
      t.string  :cpf
      t.string  :cnpj
      t.string  :ie
      t.integer :shift_id
      t.integer :user_id
      t.boolean :excluded, default: false

      t.timestamps
    end
  end
end
