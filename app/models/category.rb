# frozen_string_literal: true

# Service to download ftp files from the server

class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_expenses
  has_many :expenses, through: :categories_expenses

  validates :name, presence: true
  validates :icon, presence: true
end
