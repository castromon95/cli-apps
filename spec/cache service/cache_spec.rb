# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CacheService::Cache, type: :model do

  def expression
    CacheService::Cache.retrieve(:expression) do
      2 + 2
    end
  end
  context 'integration tests' do
    it 'Invalid block' do
      cache = CacheService::Cache.retrieve(:expression)
      expect(cache[:cached]).to be_falsey
      expect(cache[:value]).to be_nil
    end

    it 'No cache' do
      cache = expression
      expect(cache[:cached]).to be_falsey
      expect(cache[:value]).to eq(4)
    end

    it 'Use cache' do
      expression
      cache = expression
      expect(cache[:cached]).to be_truthy
      expect(cache[:value]).to eq(4)
    end

    it 'Expired cache' do
      sleep(2)
      cache = expression
      expect(cache[:cached]).to be_falsey
      expect(cache[:value]).to eq(4)
    end
  end
end
