# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  describe "when its April" do
    before(:each){ @event = Factory(:event, :start_date => "2011-04-24") }
    it "start_month_no should return 4" do
      @event.send("start_month_no").should eq 4
    end
    it "start_month should return 4月" do
      @event.send("start_month").should eq "4月"
    end
  end
  describe "function when()" do
    it "should return start date&time - end date&time" do
      event = Factory(:event, :start_date => "2011-04-24 13:48", :end_date => "2011-04-24 13:49")
      event.when.should eq "4月24日 13:48-13:49"
    end
    it "should return only start if end does not exist" do
      event = Factory(:event, :start_date => "2011-04-24 14:20")
      event.when.should eq "4月24日 14:20"
    end
    it "should return only end if start does not exist" do
      event = Factory(:event, :end_date => "2011-04-24 14:24")
#      event.when.should eq "4月24日 14:24"
    end    
  end
end
