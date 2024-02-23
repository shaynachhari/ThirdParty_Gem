class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :type
      t.string :auth_id
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
