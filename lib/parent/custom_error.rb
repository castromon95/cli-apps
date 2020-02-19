# frozen_string_literal: true

module Parent
  # CLI APP runner parent error
  class CustomError < StandardError
    attr_reader :kind

    def initialize(kind)
      @kind = kind
    end

    def message
      raise Error::FatalError
    end
  end
end
