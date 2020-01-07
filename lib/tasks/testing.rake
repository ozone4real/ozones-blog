namespace :testing do
  task :print_out do
    system("echo Heyyyyyyyyyy wassssup, whoooo cooould have thought > #{ENV['TEST_PATH']}")
  end
end