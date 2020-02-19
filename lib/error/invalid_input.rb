# frozen_string_literal: true

module Error
  # Error to handle invalid input errors
  class InvalidInputError < Parent::CustomError
    def message
      "Sorry, invalid input."
    end
  end
end
