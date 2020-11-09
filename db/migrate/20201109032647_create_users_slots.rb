class CreateUsersSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :users_slots do |t|
      t.integer :user_id, index: true
      t.datetime :appointment_date

      t.timestamps
    end
  end
end
