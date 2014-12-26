Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each do |file|
  require file
end

host = 'YOUR_HOST'
username = 'YOUR_USERNAME'

ssh_runner = DbFetcher.define_runner do
  step ssh_login: { host: host, username: username }
  step ssh_run: { command: "hostname" }
end

ssh_runner.run # => In normal case output will be silent

