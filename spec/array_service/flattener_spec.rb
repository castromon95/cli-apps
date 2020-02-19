# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ArrayService::Flattener, type: :model do
  context 'integration tests' do
    it 'using sets' do
      array = ArrayService::Flattener.new([1, 2, 3, 4, 4, 2]).execute
      expect(array.length).to eq(4)
      expect(array).to eq([1, 2, 3, 4])
    end

    it 'using uniq' do
      array = ArrayService::Flattener.new([1, 2, 3, 4, 4, 2]).execute2
      expect(array.length).to eq(4)
      expect(array).to eq([1, 2, 3, 4])
    end

    it 'programatically' do
      array = ArrayService::Flattener.new([1, 2, 3, 4, 4, 2]).execute3
      expect(array.length).to eq(4)
      expect(array).to eq([1, 2, 3, 4])
    end
  end
end
