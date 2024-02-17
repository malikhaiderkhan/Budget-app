json.extract! money_transaction, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url money_transaction_url(money_transaction, format: :json)
