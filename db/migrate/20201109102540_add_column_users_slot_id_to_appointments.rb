class AddColumnUsersSlotIdToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :users_slot_id, :integer
  end
end
