require_relative '../../../test_helper'

class DbFetcher::StepDefinitions::ScpDownloadTest < Minitest::Test
  def setup
    @context = mock()
    @step = DbFetcher::StepDefinitions::ScpDownload.new remote: 'remote_path', local: 'local_path'
  end

  def test_proper_using_context
    @context.expects(:download).with 'remote_path', 'local_path'
    @step.run @context
  end
end

