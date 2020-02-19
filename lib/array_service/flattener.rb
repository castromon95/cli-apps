# frozen_string_literal: true

module ArrayService
  # Math APP expresion calculator
  class Flattener
    def initialize(array)
      @array = array
    end

    def execute
      Set.new(array).to_a
    end

    def execute2
      array.uniq
    end

    def execute3
      array.group_by { |x| x }.keys
    end

    private

    attr_accessor :array
  end
end
