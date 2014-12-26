module DbFetcher
  extend self

  attr_accessor :logger

  def logger
    @logger = @logger || Logging::Console.new
    @logger
  end

  def define_runner(&block)
    raise 'Block must be passed!' unless block_given?
    Runner.new.define_steps(&block)
  end
end
