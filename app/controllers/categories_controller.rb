class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.order(created_at: :desc).all
    @total_amount = []
       @category = Category.includes(:categories_expenses).where(id: params[:id])
    @categories.each do |category|
      total = 0
      category.categories_expenses.each do |categories_expense|
        total += categories_expense.expense.amount
      end
      @total_amount.push(total)
    end
  end

  def show
    @expense = Expense.includes(:categories_expenses).where(id: params[:id])
    @category = Category.includes(:categories_expenses).where(id: params[:id])
  end

  def new
    @category = Category.new
  end


  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category added successfully"
    else
      redirect_to new_category_path, notice: "Category failed"
    end
  end

    private

    def category_params
      params.require(:category).permit(:name, :icon)
    end
end
