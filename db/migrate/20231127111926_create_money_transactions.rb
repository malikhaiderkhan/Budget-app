class CreateMoneyTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :money_transactions do |t|
      t.string :name
      t.decimal :amount
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
