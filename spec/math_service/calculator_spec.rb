# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MathService::Calculator, type: :model do
  context 'integration tests' do
    it 'no precedence' do
      expect(MathService::Calculator.new('2 + 2').execute)
        .to eq(4)
    end

    it 'with precedence' do
      expect(MathService::Calculator.new('2 + 2 * 10 + 4').execute)
        .to eq(26)
    end

    it 'with parenthesis' do
      expect(MathService::Calculator.new('(2 + 2) * 10 + 4').execute)
        .to eq(44)

      expect(MathService::Calculator.new('2 + (10 + 4) * 2').execute)
        .to eq(30)
    end
  end
end
