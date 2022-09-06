require 'rails_helper'

describe 'ValidationError' do
  let(:klass) do
    Class.new do
      extend ValidationError

      attr_reader :name

      def initialize
        @name = 'Test'
      end
    end
  end

  context 'uniqueness_validation_message' do
    it 'returns the validation error message' do
      response = klass.uniqueness_validation_message(klass.new, { model: 'KlassName', attribute: 'name' })
      expect(response).to eq 'KlassName with the name Test already exists...'
    end
  end
end
