    class AddPersonsToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :provider, :boolean
    add_column :people, :client,   :boolean, default: true
    add_column :people, :user,     :boolean
  end
end
