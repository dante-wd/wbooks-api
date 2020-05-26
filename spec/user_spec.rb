describe User, type: :model do
  it do
    should validate_presence_of(:first_name)
  end
  
  subject(:user) do
    create(:user)
  end
  
  it { is_expected.to be_valid }
end