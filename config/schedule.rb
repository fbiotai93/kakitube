set :output, "#{path}/log/cron_log.log"
env :PATH, ENV['PATH']

every 1.day, :at => '5:00 am' do
  rake "-s sitemap:refresh"
end
