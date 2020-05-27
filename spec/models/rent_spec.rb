require 'rails_helper'

describe Rent, type: :model do

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:book_id) }
  it { should validate_presence_of(:from) }
  it { should validate_presence_of(:to) }

  subject(:rent) do
		create(:rent, user: create(:user), book: create(:book))
	end

	it { is_expected.to be_valid }

	describe '#create' do
    context 'When the user_id is nil' do
      it {expect(build(:rent, user_id: nil)).to be_invalid}
    end

    context 'When the book_id is nil' do
      it {expect(build(:rent, book_id: nil)).to be_invalid}
    end

    context 'When the from date is nil' do
      it {expect(build(:rent, from: nil)).to be_invalid}
    end

    context 'When the to date is nil' do
      it {expect(build(:rent, to: nil)).to be_invalid}
    end

    context 'When from date is after to date' do
    	it {expect(build(:rent, from: Date.today, to: Faker::Date.backward(days:30))).to be_invalid}
    end
    context 'When to date is before from date' do
    	it {expect(build(:rent, from: Faker::Date.backward(days:30), to: Date.today)).to be_invalid}
    end
  end
end