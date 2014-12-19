require_relative '../../test_helper'

class DbFetcher::RunnerTest < Minitest::Test
  def setup
    @runner = DbFetcher::Runner.new
  end

  def test_responsebilities
    assert_respond_to @runner, :steps
    assert_respond_to @runner, :define_steps
    assert_respond_to @runner, :run
  end

  def test_define_steps_returns_self
    assert_equal @runner, @runner.define_steps {}
  end

  def test_defining_steps
    @runner.define_steps do
      step
    end
    assert_equal @runner.steps.count, 1
  end
end
