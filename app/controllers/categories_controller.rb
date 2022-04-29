# frozen_string_literal: true

class CategoriesController < ApplicationController
  # load_and_authorize_resource

  def index
    @categories = current_user.categories.order(created_at: :desc).all
    @total_cost = []
    @category = Category.includes(:categories_expenses).where(id: params[:id])
    @categories.each do |category|
      total = 0
      category.categories_expenses.each do |categories_expense|
        total += categories_expense.expense.amount
      end
      @total_cost.push(total)
    end
  end

  def show
    @categoryi = Category.find(params[:id])
    @expense = Expense.includes(:categories_expenses).order(created_at: :desc).where(category_id: @categoryi.id)
    @category = Category.includes(:categories_expenses).where(id: params[:id])

    @total_cost = @expense.where(category_id: @categoryi.id).sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path, flash: { success: 'Category added successfully' }
    else
      redirect_to new_category_path, notice: 'Category failed'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
