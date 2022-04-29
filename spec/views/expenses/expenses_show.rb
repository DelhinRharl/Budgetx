require 'rails_helper'

RSpec.describe 'expenses#index', type: :feature do
  describe 'Expense' do
    before(:each) do
      @user = User.create(name: 'Afff', email: 'y@gmail.com', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'y@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @cat = Expense.create(user: @user, name: 'Food', icon: 'icon')

      @expense1 = Expense.create(user: @user, name: 'Food', amount: 5)
      @expense2 = Expense.create(user: @user, name: 'Clothes', amount: 5)
      @expense3 = Expense.create(user: @user, name: 'Drinks', amount: 5)
      @expense4 = Expense.create(user: @user, name: 'Premiums', amount: 5)

      @group_expense = CategoryExpense.create(category: @cat, expense: @expense1)

      visit(expenses_path(@category.id))
    end

    it 'shows the expense name' do
      expect(page).to have_content('Food')
    end

    it 'shows the expense amount' do
      expect(page).to have_content('5')
    end
  end
end