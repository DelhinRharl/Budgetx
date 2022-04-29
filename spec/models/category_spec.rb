require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    user = User.create(name: 'Delhin', email: 'finer@gmail.com', password: '123456')
    subject { Category.new(user_id: user, name: 'drinks', icon: 'icon') }
    before { subject.save }

    it 'checks name presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

     it 'validates presence of icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'checks for name validation' do
      subject.name = 'Rumplestiltskinniftyspo'
      expect(subject).to_not be_valid
    end
  end
end