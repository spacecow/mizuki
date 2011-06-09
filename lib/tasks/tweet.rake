namespace :tweet do
  task :save => :environment do
    Tweet.save_tweet
  end
end
