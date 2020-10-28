class CreateAccountOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :account_operations do |t|
      t.float :value, null: false, default: 0
      t.date :date_operation, null: false, default: -> { 'CURRENT_DATE' }
      t.string :operation, null: false, default: ""

      t.timestamps
    end
  end
end
