# frozen_string_literal: true

module Error
  # Error to handle unexpected CLI APP runner errors
  class FatalError < Parent::CustomError
    def initialize
      super(:error)
    end

    def message
      'An unexpected error has occured, please contact '\
      "#{Runner::AUTHORS.first} via email "\
      "(#{Runner::EMAILS.first}) for technical support"
    end
  end
end
