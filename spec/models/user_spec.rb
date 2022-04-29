require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'love', email: 'love@gmail.com', password: '123456') }
    before { subject.save }

    it 'validates name presence' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates email presence' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end