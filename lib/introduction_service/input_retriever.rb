# frozen_string_literal: true

module IntroductionService
  # CLI APP runner input retriever
  class InputRetriever < Parent::Speaker
    def initialize(prompt, input)
      super(prompt)
      @input = input
    end

    def execute
      question = "Please insert #{@input}"
      @prompt.ask(question) do |q|
        q.required(true, "You must insert a #{@input}")
      end
    end

    private

    attr_accessor :input
  end
end
