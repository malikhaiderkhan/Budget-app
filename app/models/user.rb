class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  has_many :categories
  has_many :money_transactions, foreign_key: 'author_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
