namespace :shopkeep do
  desc "Starts the daemonised server"
  task :start => :environment do
    puts 'Starting Rails server'
    `bundle exec rails server -d -b 0.0.0.0`
  end

  desc "Stops the daemonised server"
  task :stop => :environment do
    pidfile = 'tmp/pids/server.pid'
    if File.exist? pidfile
      puts 'Stopping Rails server'
      `kill $(cat #{pidfile})`
    else
      puts 'No Rails server running, nothing to stop'
    end
  end
end
