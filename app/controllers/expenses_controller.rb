class ExpensesController < ApplicationController

  # load_and_authorize_resource

  def index
   @expenses = current_user.expenses.order(created_at: :desc).all
    @total_cost = []
    @category = Category.includes(:categories_expenses).where(id: params[:id])
    @categories = Category.all
    @expenses.each do |expense|
    total = 0
    expense.categories_expenses.each do |categories_expense|
    total += categories_expense.expense.amount
    end
    @total_cost.push(total)
    end
  end

  def new
    @expense = Expense.new
    @category = Category.all
  end

  def show
    @expense = Expense.find(params[:id])
    @category = Category.find(@expense.category_id)
    @total_cost = 0
    @category.categories_expenses.each do |categories_expense|
      @total_cost += categories_expense.expense.amount
    end
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    @categories = Category.all
    if @new_expense.save
      CategoriesExpense.create(category_id:@new_expense.category_id, expense_id: @new_expense.id)
      redirect_to expenses_path(params[:category_id]), flash: { success: "Expense added successfully" }
    else
      redirect_to new_category_expense_path, notice: "Expense failed"
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount,:category_id)
  end
end