class AddCategoryIdToMoneyTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :money_transactions, :category_id, :bigint
  end
end
