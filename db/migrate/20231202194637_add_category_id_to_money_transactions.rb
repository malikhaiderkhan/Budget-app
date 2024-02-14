class AddCategoryIdToMoneyTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :money_transactions, :category_id, true
  end
end
