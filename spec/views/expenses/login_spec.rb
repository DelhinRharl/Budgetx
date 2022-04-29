# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }
  scenario 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  scenario 'displays password field' do
    expect(page).to have_field('user[password]')
  end

  scenario 'displays login button' do
    expect(page).to have_button('Log in')
  end

  context 'Form Submission' do
    scenario 'Empty fields' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'wrong password' do
      within 'form' do
        fill_in 'Email', with: 'mymail@gmail.com'
        fill_in 'Password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'correct details' do
      @user = User.create(name: 'Punzel', email: 'd@gmail.com', password: '123456')
      within 'form' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
      expect(page).to have_current_path('/')
    end
  end
end
