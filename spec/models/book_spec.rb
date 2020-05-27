require 'rails_helper'

describe Book, type: :model do
  it { should validate_presence_of(:title)      }
  it { should validate_presence_of(:author)     }
  it { should validate_presence_of(:image)      }
  it { should validate_presence_of(:genre)      }
  it { should validate_presence_of(:publisher)  }
  it { should validate_presence_of(:year)       }
  
  subject(:book) do
    create(:book)
  end

  it { is_expected.to be_valid }

  describe '#create' do
    context 'When the title is nil' do
      it {expect(build(:book, title: nil)).to be_invalid}
    end

    context 'When the author is nil' do
      it {expect(build(:book, author: nil)).to be_invalid}
    end

    context 'When the image is nil' do
      it {expect(build(:book, image: nil)).to be_invalid}
    end

    context 'When the genre is nil' do
      it {expect(build(:book, genre: nil)).to be_invalid}
    end

    context 'When the publisher is nil' do
      it {expect(build(:book, publisher: nil)).to be_invalid}
    end

    context 'When the year is nil' do
      it {expect(build(:book, year: nil)).to be_invalid}
    end
  end
end