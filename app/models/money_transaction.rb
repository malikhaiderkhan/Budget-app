class MoneyTransaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :category_transactions
  has_many :categories, through: :category_transactions
end
