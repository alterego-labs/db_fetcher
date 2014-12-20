module DbFetcher
  class StepBuilder
    attr_reader :steps

    def initialize
      @steps = []
    end

    def step
      @steps << DbFetcher::StepDefinitions::Basic.new
    end
  end
end
