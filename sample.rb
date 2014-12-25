Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each do |file|
  require file
end

simple_runner = DbFetcher.define_runner do
  step local_run: { command: "echo 'Hello world!'" }
end

simple_runner.run # => Hello world!
