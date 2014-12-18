Dir[File.dirname(__FILE__) + '/lib/**/*_test.rb'].each do |file|
  load file
end
