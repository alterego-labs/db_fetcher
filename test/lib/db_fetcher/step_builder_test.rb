require_relative '../../test_helper.rb'

class DbFetcher::StepBuilderTest < Minitest::Test
  def test_responsebilities
    obj = DbFetcher::StepBuilder.new
    assert_respond_to obj, :step
  end
end
