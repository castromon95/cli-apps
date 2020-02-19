# frozen_string_literal: true

module MathService
  # Math APP expresion evaluator
  class Evaluator
    def initialize(tokens)
      @tokens = tokens
    end

    def execute
      numbers = []
      @tokens.each do |token|
        if token.type == :int
          numbers << token
        else
          operation(numbers, token)
        end
      end
      numbers.pop.value
    end

    private

    def operation(numbers, token)
      first_number = numbers.pop
      second_number = numbers.pop
      raise Error::InvalidInput unless first_number && second_number

      result = evaluate(first_number.value, second_number.value, token)
      numbers << MathService::MathElement.new(:int, result)
    end

    def evaluate(first_number, second_number, operation)
      case operation.value
      when '+' then first_number.to_i + second_number.to_i
      when '-' then first_number.to_i - second_number.to_i
      when '*' then first_number.to_i * second_number.to_i
      when '/' then first_number.to_i / second_number.to_i
      end
    end
  end
end
