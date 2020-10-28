class AddAccountToAccountOperations < ActiveRecord::Migration[6.0]
  def change
    add_reference :account_operations, :account, foreign_key: true
  end
end
