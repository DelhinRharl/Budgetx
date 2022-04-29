# frozen_string_literal: true

class CategoriesExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :category
end
