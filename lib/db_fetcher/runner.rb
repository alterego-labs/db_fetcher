module DbFetcher
  class Runner
    attr_reader :steps

    def initialize
      @steps = []
    end

    def define_steps(&block)
      builder = StepBuilder.new
      builder.instance_exec(&block)
      @steps = builder.steps
      self
    end

    def run
      @steps.each { |step| process_step(step) }
    end

    private

    def process_step(step)
      code = step.target_context
      context = DbFetcher::ContextRegister.get code
      step.run context
    end
  end
end
