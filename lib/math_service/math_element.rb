# frozen_string_literal: true

module MathService
  # Model to represent a math element
  class MathElement
    attr_reader :type
    attr_reader :value

    def initialize(type, value)
      @type = type
      @value = value
    end

    def priority
      return 1 if %w[+ -].include?(value)
      return 2 if %w[* /].include?(value)

      0
    end

    def parenthesis
      %w[( )].include?(value)
    end

    def closing_parenthesis
      value == ')'
    end

    def oppening_parenthesis
      value == '('
    end
  end
end
