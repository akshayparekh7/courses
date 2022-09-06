require 'rails_helper'
describe Course, type: :model do
  describe 'saving course object with distinct name' do
    subject do
      described_class.new(name: 'foo')
    end

    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  describe 'saving course object with existing name' do
    before do
      described_class.new(name: 'foo').save
    end

    subject do
      described_class.new(name: 'foo')
    end

    it 'is invalid' do
      expect(subject).to_not be_valid
    end
  end

  it { should accept_nested_attributes_for(:tutors) }
  it { should have_many(:tutors) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).with_message('') }
end
