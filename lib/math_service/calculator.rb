# frozen_string_literal: true

module MathService
  # Math APP expresion calculator
  class Calculator
    require 'strscan'
    def initialize(expresion)
      @buffer = StringScanner.new(expresion)
    end

    def execute
      numbers = []
      operators = []
      until @buffer.eos?
        skip_spaces
        read_tokens(numbers, operators)
      end
      tokens = numbers + operators.reverse
      MathService::Evaluator.new(tokens).execute
    end

    private

    RULES = { /\d+/ => :int, %r{[\/+\-*()]} => :op }.freeze
    attr_accessor :buffer

    def skip_spaces
      @buffer.skip(/\s+/)
    end

    def read_tokens(numbers, operators)
      RULES.each do |regex, type|
        value = @buffer.scan(regex)
        add_value(numbers, operators, type, value) if value
      end
    end

    def add_value(numbers, operators, type, value)
      math_element = MathService::MathElement.new(type, value)
      if type == :int
        numbers << math_element
      else
        operator_precedence(numbers, operators, math_element)
      end
    end

    def operator_precedence(numbers, operators, math_element)
      if math_element.closing_parenthesis
        parenthesis_precedence(numbers, operators)
      elsif operators.last && !operators.last.parenthesis &&
            !math_element.parenthesis && math_element.priority < operators.last.priority
        numbers << operators.pop
      end
      operators << math_element unless math_element.closing_parenthesis
    end

    def parenthesis_precedence(numbers, operators)
      found = false
      until found || operators.empty?
        operator = operators.pop
        if operator.oppening_parenthesis
          found = true
        else
          numbers << operator
        end
      end
    end
  end
end
