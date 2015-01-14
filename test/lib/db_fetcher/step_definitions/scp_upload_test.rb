require_relative '../../../test_helper'

class DbFetcher::StepDefinitions::ScpUploadTest < Minitest::Test
  def setup
    @context = mock()
    @step = DbFetcher::StepDefinitions::ScpUpload.new remote: 'remote_path', local: 'local_path'
  end

  def test_proper_using_context
    @context.expects(:upload).with 'remote_path', 'local_path'
    @step.run @context
  end
end

