# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense model' do
    user = User.create(name: 'SicBilly', email: 'billly@gmail.com', password: '123456')
    subject { Expense.new(user_id: user, name: 'food', amount: 200) }
    before { subject.save }

    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'checks if price is >1' do
      expect(subject.amount).to be >= 1
    end

    it 'checks for name validation' do
      subject.name = 'Rumplestiltskinniftyspo'
      expect(subject).to_not be_valid
    end

    it 'validates numericality ' do
      subject.amount = 'yes'
      expect(subject).to_not be_valid
    end
  end
end
