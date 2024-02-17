class Category < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user
  has_many :category_payments
  has_many :payments, through: :category_payments
  has_one_attached :icon
end
