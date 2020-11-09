class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :user_id, index: true
      t.timestamps
    end
  end
end
