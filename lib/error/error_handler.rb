# frozen_string_literal: true

module Error
  # Centralized CLI APP runner custom error handler
  class ErrorHandler < Parent::Speaker
    def handle(error)
      @prompt.send(error.kind, error.message)
    end
  end
end
