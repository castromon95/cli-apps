# frozen_string_literal: true

module CacheService
  # Cache with expiration
  class Cache
    @data = {}

    def self.retrieve(key, expires_in = 2, &block)
      cached = false
      value = if @data.key?(key) && (@data[key][:expiration_time] > Time.now.to_i)
                cached = true
                @data[key][:value]
              elsif block_given?
                @data[key] = { value: yield(block), expiration_time: Time.now.to_i + expires_in }
                @data[key][:value]
              end
      { cached: cached, value: value }
    end
  end
end
