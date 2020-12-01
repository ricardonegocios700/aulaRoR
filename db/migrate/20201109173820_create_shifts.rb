class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.string  :description, null: false
      t.time    :start_time
      t.time    :endtime_time
      t.boolean :sunday
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :fourth
      t.boolean :fifth
      t.boolean :friday
      t.boolean :saturday
      t.boolean :excluded, default: false

      t.timestamps
    end
  end
end
