module DbFetcher
  class Runner
    attr_reader :steps

    def initialize
      @steps = []
    end

    def define_steps(&block)
      builder = StepBuilder.new
      builder.instance_exec(&block)
      @steps = builder.steps.dup
      self
    end

    def run
    end
  end
end
