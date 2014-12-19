module DbFetcher
  class StepBuilder
    attr_reader :steps

    def initialize
      @steps = []
    end

    def step
      @steps << 'some_step_instance'
    end
  end
end
