require 'spec_helper'

class MochaUser
  def initialize(name); @screen_name = name end
  def screen_name; @screen_name end
end

class MochaTweet
  def initialize(s,name,time)
    @text = s
    @user = MochaUser.new(name)
    @created_at = time 
  end
  def created_at; @created_at end
  def text; @text end
  def user; @user end
end

describe Tweet do
  before(:each) do
     Tweet.stubs(:remote_tweet).returns(
       MochaTweet.new("my tweet", "username", "2011-05-04 11:53:00"))
  end

  it "should return last tweet if no change" do
    Tweet.create!(:created_at => "2011-5-4 11:53", :content => "my tweet", :who => "username")
    Tweet.count.should eq 1
    Tweet.save_tweet
    Tweet.count.should eq 1
    Tweet.last.created_at.should eq Time.zone.parse("2011-5-4 11:53")
    Tweet.last.content.should eq "my tweet"
    Tweet.last.who.should eq "username"
  end

  it "should create a new tweet if no tweet" do
    Tweet.count.should eq 0
    Tweet.save_tweet
    Tweet.count.should eq 1
    Tweet.last.created_at.should eq Time.zone.parse("2011-5-4 11:53")
    Tweet.last.content.should eq "my tweet"
    Tweet.last.who.should eq "username"
  end

  it "should create a new tweet if only old tweet" do
    Tweet.create!(:created_at => "2011-5-4 11:50", :content => "old tweet") 
    Tweet.count.should eq 1
    Tweet.save_tweet
    Tweet.count.should eq 2
    Tweet.last.created_at.should eq Time.zone.parse("2011-5-4 11:53")
    Tweet.last.content.should eq "my tweet"
    Tweet.last.who.should eq "username"
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

