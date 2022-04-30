# frozen_string_literal: true

class AddCategoryIdToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :category, null: false, foreign_key: true
  end
end
