class CreateUsersTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tokens do |t|
      t.integer :user_id, index: true
      t.string :token

      t.timestamps
    end
  end
end
