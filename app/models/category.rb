# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_expenses
  has_many :expenses, through: :categories_expenses

  validates :name, presence: true
  validates :icon, presence: true
end
