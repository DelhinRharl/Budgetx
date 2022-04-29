class Expense < ApplicationRecord
  belongs_to :user
  has_many :categories_expenses
  has_many :categories, through: :categories_expenses

  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
