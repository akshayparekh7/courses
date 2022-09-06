require 'rails_helper'
describe Tutor, type: :model do
  let(:course) do
    Course.create(name: 'foo')
  end

  describe 'saving tutor object with distinct email' do
    subject do
      described_class.new(name: 'Test', email: 'foo', course:)
    end

    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  describe 'saving course object with existing email' do
    before do
      described_class.new(name: 'Test', email: 'foo', course:).save
    end

    subject do
      described_class.new(name: 'Test', email: 'foo', course:)
    end

    it 'is invalid' do
      expect(subject).to_not be_valid
    end
  end

  describe 'saving tutor object without email' do
    subject do
      described_class.new(name: 'Test', email: nil, course:)
    end

    it 'is invalid' do
      expect(subject.save).to be_falsy
    end
  end

  it { should belong_to(:course) }
  it { should validate_uniqueness_of(:email).with_message('') }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
end
