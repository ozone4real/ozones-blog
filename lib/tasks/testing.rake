require 'pathname'

namespace :testing do
  task :print_out do
    path = ENV['TEST_PATH']
    Dir.mkdir(path) unless Dir.exist?(path)
    
    file = File.open(File.join(path, 'test_out.txt'), 'a')
    file.write("Wassup bro. The time is #{Time.now}")
  end
end