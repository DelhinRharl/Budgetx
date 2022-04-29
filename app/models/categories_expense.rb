# frozen_string_literal: true

# Service to download ftp files from the server

class CategoriesExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :category
end
