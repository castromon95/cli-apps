# frozen_string_literal: true

module IntroductionService
  # Bowling scoring APP initializer
  class Initializer < Parent::Speaker
    def execute(input)
      IntroductionService::Introducer.new(@prompt).execute
      IntroductionService::InputRetriever.new(@prompt, input).execute
    end
  end
end
