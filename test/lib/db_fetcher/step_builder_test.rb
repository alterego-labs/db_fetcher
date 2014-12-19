require_relative '../../test_helper.rb'

class DbFetcher::StepBuilderTest < Minitest::Test
  def setup
    @builder = DbFetcher::StepBuilder.new
  end

  def test_responsebilities
    assert_respond_to @builder, :step
    assert_respond_to @builder, :steps
  end

  def test_populating_steps
    @builder.step
    assert_equal @builder.steps.count, 1
  end
end
