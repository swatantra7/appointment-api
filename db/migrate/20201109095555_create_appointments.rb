class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :from
      t.datetime :to
      t.integer :patient_id, index: true
      t.integer :doctor_id, index: true

      t.timestamps
    end
  end
end
