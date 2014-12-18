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
end
