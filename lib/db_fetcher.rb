module DbFetcher
  extend self

  attr_reader :contexts

  def contexts
    @contexts || []
  end

  def register_context(code)
    @contexts ||= []
    @contexts << code
  end

  def define_runner(&block)
    raise 'Block must be passed!' unless block_given?
    Runner.new.define_steps(&block)
  end
end
