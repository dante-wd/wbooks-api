require 'rails_helper'

describe User, type: :model do
  it do
    should validate_presence_of(:first_name)
  end
  it do
    should validate_presence_of(:last_name)
  end

  subject(:user) do
    create(:user)
  end

  it { is_expected.to be_valid }

  describe '#create' do
    context 'When the first_name is nil' do
      it {expect(build(:user, first_name: nil)).to be_invalid}
    end

    context 'When the last_name is nil' do
      it {expect(build(:user, last_name: nil)).to be_invalid}
    end
  end
end