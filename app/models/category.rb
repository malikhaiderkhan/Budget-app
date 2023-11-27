class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :category_transactions
  has_many :money_transactions, through: :category_transactions
end
