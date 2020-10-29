class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :account_number, null: false
      t.string :name, null: false, default: ""
      t.date :birth_date, null: false, default: -> { 'CURRENT_DATE' }
      t.string :password_digest, null: false, default: ""
      t.float :current_balance, null: false, default: 0
      t.float :previous_balance, null: false, default: 0

      t.timestamps
    end
  end
end
