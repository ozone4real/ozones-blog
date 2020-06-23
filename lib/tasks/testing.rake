require 'pathname'

namespace :testing do
  task :print_out do
    desc "Testing shit"
    path = ENV['TEST_PATH']
    Dir.mkdir(path) unless Dir.exist?(path)
    
    file = File.open(File.join(path, 'test_out.txt'), 'a')
    file.write("Wassup bro. The time is #{Time.now}")
  end

  # task with arguments
  task :arg_task, [:papa, :mama] do |t, args|
    puts args.papa, args.mama
    p args.to_a
    "Yeeepeee"
  end

  file "prof" do |t|
    mkdir t.name
  end
end

task :capaichumarumai do  
  Rake::Task["testing:arg_task"].invoke
end