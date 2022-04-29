# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categorys#index', type: :feature do
  describe 'category' do
    before(:each) do
      @user = User.create(name: 'Kriml', email: 'yay@gmail.com', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'yay@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @category1 = Category.create(user: @user, name: 'Clothes', icon: 'icon')
      @category2 = Category.new(user: @user, name: 'Drinks', icon: 'icon')
      @category3 = Category.new(user: @user, name: 'Cereals', icon: 'icon')
      @category4 = Category.new(user: @user, name: 'Leisure', icon: 'icon')

      visit(categories_path)
    end

    it 'shows the category name' do
      expect(page).to have_content('Clothes')
    end

    it 'shows the category amount' do
      expect(page).to have_content('0')
    end
  end
end
