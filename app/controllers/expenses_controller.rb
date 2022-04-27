class ExpensesController < ApplicationController
  def index
    @category = @categories.find(params[expense_params])
    @expense = Expense.all
  end

  def new
    @expense = Expense.new
    @category = Category.all
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    @categories = Category.all
    if @new_expense.save
      CategoriesExpense.create(category_id: params[:category_id], expense_id: @new_expense.id)
      redirect_to expenses_path(params[:category_id]), flash: { success: "Expense added successfully" }
    else
      redirect_to new_category_expense_path, notice: "Expense failed"
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end