# Use this file to easily define all of your cron jobs.
# env :GEM_PATH, ENV['GEM_PATH']
# set :bundle_command, "RAILS_ENV=production; source /usr/local/rvm/scripts/rvm /usr/local/bin/bundle exec"
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every 2.minutes do
  test_path = File.join(File.expand_path('../..'), 'shared/files')
  job_type :rake, "cd :path && :environment_variable=:environment TEST_PATH=#{test_path} bundle exec rake :task --silent :output"
  rake 'testing:print_out'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
