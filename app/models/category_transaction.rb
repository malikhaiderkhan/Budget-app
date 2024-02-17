class CategoryTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :money_transaction
end
