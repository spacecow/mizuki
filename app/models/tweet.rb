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
      Twitter.user_timeline("mizukisaori").first
    end
end

# == Schema Information
#
# Table name: tweets
#
#  id         :integer(4)      not null, primary key
#  who        :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

