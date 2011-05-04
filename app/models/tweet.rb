class Tweet < ActiveRecord::Base
  def self.save_tweet
    tweet = remote_tweet 
    if !Tweet.last || Tweet.last.created_at < Time.zone.parse(tweet.created_at)
      Tweet.create!(:content => tweet.text,
                    :who => tweet.user.screen_name,
                    :created_at => tweet.created_at)
    end
  end

  private
    def self.remote_tweet
      Twitter.user_timeline("rymdtjuren").first
    end
end
