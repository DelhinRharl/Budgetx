class Expense < ApplicationRecord
  belongs_to :user
  has_many :categories_expenses
  has_many :categories, through: :categories_expenses
end
