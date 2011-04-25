# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  describe "when its April" do
    before(:each) do
      @event = Factory(:event, :start_date => "2011-04-24",
                       :end_date => "2011-04-24")
    end
    it "month_no should return 4" do
      @event.send("month_no",@event.start_date).should eq 4
      @event.send("month_no",@event.start_date).should eq 4
    end
    it "month should return 4月" do
      @event.send("month",@event.start_date).should eq "4月"
      @event.send("month",@event.end_date).should eq "4月"
    end
  end
  describe "function when()" do
    describe "for both start_date and end_date, the end field" do
      it "should contain time if the difference is less than a day" do
        event = Factory(:event, :start_date => "2011-04-24 13:48",
                        :end_date => "2011-04-24 13:49")
        no_day = Factory(:event, :start_date => "2011-04-25 9:49",
                         :end_date => "2011-04-26 2:00")
        day = Factory(:event, :start_date => "2011-04-25 9:50",
                      :end_date => "2011-04-26 10:00")
        event.when.should eq "4月24日 13:48-13:49"
        no_day.when.should eq "4月25日 09:49-02:00"
        day.when.should eq "4月25日 09:50-26日 10:00"
      end
      it "should not contain month if diff is less than a month(days)" do
        no_month_28 = Factory(:event, :start_date => "2011-02-25 12:20",
                              :end_date => "2011-03-24 13:00")
        month_28 = Factory(:event, :start_date => "2011-02-25 12:21",
                           :end_date => "2011-03-26 11:00")
        no_month_29 = Factory(:event, :start_date => "2012-02-25 12:17",
                              :end_date => "2012-03-24 13:00")
        month_29 = Factory(:event, :start_date => "2012-02-25 12:18",
                           :end_date => "2012-03-26 11:00")
        no_month_30 = Factory(:event, :start_date => "2011-04-25 10:17",
                              :end_date => "2011-05-24 13:00")
        month_30 = Factory(:event, :start_date => "2011-04-25 11:59",
                           :end_date => "2011-05-26 11:00")
        no_month_31 = Factory(:event, :start_date => "2011-05-25 12:01",
                              :end_date => "2011-06-24 13:00")
        month_31 = Factory(:event, :start_date => "2011-05-25 12:03",
                           :end_date => "2011-06-26 11:00")
        no_month_28.when.should eq "2月25日 12:20-24日 13:00"
        month_28.when.should eq "2月25日 12:21-3月26日 11:00"
        no_month_29.when.should eq "2月25日 12:17-24日 13:00"
        month_29.when.should eq "2月25日 12:18-3月26日 11:00"
        no_month_30.when.should eq "4月25日 10:17-24日 13:00"
        month_30.when.should eq "4月25日 11:59-5月26日 11:00"
        no_month_31.when.should eq "5月25日 12:01-24日 13:00"
        month_31.when.should eq "5月25日 12:03-6月26日 11:00"
      end
      it "should not contain month if diff is less than a month(hours)" do
        no_month = Factory(:event, :start_date => "2011-04-25 10:25",
                           :end_date => "2011-05-25 9:00")
        month = Factory(:event, :start_date => "2011-04-25 11:56",
                        :end_date => "2011-05-25 11:57")
        no_month.when.should eq "4月25日 10:25-25日 09:00"
        month.when.should eq "4月25日 11:56-5月25日 11:57"
      end
      it "should not contain year if diff is less than a year" do
        no_year_month = Factory(:event, :start_date => "2011-04-25 13:01",
                                :end_date => "2012-03-26 9:00")
        year_month = Factory(:event, :start_date => "2011-04-25 13:02",
                             :end_date => "2012-05-24 11:00")
        no_year_day = Factory(:event, :start_date => "2011-04-25 13:11",
                              :end_date => "2012-04-24 14:00")
        year_day = Factory(:event, :start_date => "2011-04-25 13:12",
                           :end_date => "2012-04-26 11:00")
        no_year_month.when.should eq "4月25日 13:01-3月26日 09:00"
        year_month.when.should eq "4月25日 13:02-2012年5月24日 11:00"
        no_year_day.when.should eq "4月25日 13:11-4月24日 14:00"
        year_day.when.should eq "4月25日 13:12-2012年4月26日 11:00"

      end      
    end

    it "should display date according to existing data" do
      full = Factory(:event, :start_date => "2011-04-25 13:21")
      no_min = Factory(:event, :start_date => "2011-04-25")
      p no_min
      full.when.should eq "4月25日 13:21"
    end
    
    it "should return only start if end does not exist" do
      event = Factory(:event, :start_date => "2011-04-24 14:20")
      event.when.should eq "4月24日 14:20"
    end
    it "should return only end if start does not exist" do
      event = Factory(:event, :end_date => "2011-04-24 14:24")
      event.when.should eq "4月24日 14:24"
    end
  end
end
