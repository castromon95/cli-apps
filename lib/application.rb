# frozen_string_literal: true

# Application runner container
class Application
  attr_writer :prompt

  def start
    input = IntroductionService::Initializer.new(prompt).execute('math expression')
    result = MathService::Calculator.new(input).execute
    prompt.ok("The result is #{result}")
  rescue Parent::CustomError => e
    Error::ErrorHandler.new(prompt).handle(e)
  rescue StandardError
    Error::ErrorHandler.new(prompt).handle(Error::FatalError.new)
  end

  private

  def prompt
    @prompt ||= TTY::Prompt.new
  end
end
