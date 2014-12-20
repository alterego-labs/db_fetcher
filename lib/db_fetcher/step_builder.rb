module DbFetcher
  class StepBuilder
    attr_reader :steps

    def initialize
      @steps = []
    end

    # Define step for runner
    #
    # ==== Attributes
    #
    # * +opts+ - options for defining proper step. It may be hash or even instance one of the predefined steps.
    #
    # ==== Examples
    #
    # builder = DbFetcher::StepBuilder.new
    # # Passing hash
    # builder.step local_run: { command: 'rake test' }
    # # Define step manually
    # another_step = DbFetcher::StepDefinitions::LocalRun.new(command: 'cd some_project')
    # # Add defined step to step builder
    # builder.step another_step
    def step
      @steps << DbFetcher::StepDefinitions::Basic.new
    end
  end
end
