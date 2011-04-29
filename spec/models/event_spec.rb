# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  def event(s,e=nil)
    f = Factory(:event)
    if s
      sp = s.split
      if sp.length == 2
        f.start_date = sp[0]
        f.start_time = sp[1]
      elsif sp[0] =~ /:/
        f.start_time = sp[0]
      else
        f.start_date = sp[0]
      end
    end
    if e
      sp = e.split
      if sp.length == 2
        f.end_date = sp[0]
        f.end_time = sp[1]
      elsif sp[0] =~ /:/
        f.end_time = sp[0]
      else
        f.end_date = sp[0]
      end
    end
    f
  end
  
  describe "function start()" do
    it "should" do
      event = event("2011-04-29 16:21")
      event.start.to_s.should eq "2011-04-29 16:21:00 UTC"

      event = event("2011-04-29")
      event.start.to_s.should eq "2011-04-29 00:00:00 UTC"

      event = event(nil,"2011-04-29")
      event.start.to_s.should eq "2011-04-29 00:00:00 UTC"

      event = event(nil, "2011-04-29 16:37")
      event.start.to_s.should eq "2011-04-29 16:37:00 UTC"

      event = event("16:36", "2011-04-29 16:37")
      event.start.to_s.should eq "2011-04-29 16:36:00 UTC"

      event = event("16:44", "2011-04-29")
      event.start.to_s.should eq "2011-04-29 16:44:00 UTC"

      event = event("2011-04-29", "16:45")
      event.start.to_s.should eq "2011-04-29 16:45:00 UTC"

      event = event("2011-04-29 16:46", "16:45")
      event.start.to_s.should eq "2011-04-29 16:46:00 UTC"

      event = event("16:47")
      event.start.to_s.should eq "まだ発表されていません"       

      event = event(nil,"16:48")
      event.start.to_s.should eq "まだ発表されていません"

      event = event(nil,nil)
      event.start.to_s.should eq "まだ発表されていません"             
    end
  end
  
  describe "function when()" do
    describe "for both start_date and end_date, the end field" do
      it "should contain time if the difference is less than a day" do
        event = Factory(:event, :start_date => "2011-04-24",
                        :start_time => "13:48",
                        :end_date => "2011-04-24",
                        :end_time => "13:49")
        no_day = Factory(:event, :start_date => "2011-04-25",
                         :start_time => "9:49",
                         :end_date => "2011-04-26",
                         :end_time => "2:00")
        day = Factory(:event, :start_date => "2011-04-25",
                      :start_time => "9:50",
                      :end_date => "2011-04-26",
                      :end_time => "10:00")
        event.when.should eq "4月24日 13:48-13:49"
        no_day.when.should eq "4月25日 09:49-02:00"
        day.when.should eq "4月25日 09:50-26日 10:00"
      end
      it "should not contain month if diff is less than a month(days)" do
        no_month_28 = Factory(:event, :start_date => "2011-02-25",
                              :start_time => "12:20",
                              :end_date => "2011-03-24",
                              :end_time => "13:00")
        month_28 = Factory(:event, :start_date => "2011-02-25",
                           :start_time => "12:21",
                           :end_date => "2011-03-26",
                           :end_time => "11:00")
        no_month_29 = Factory(:event, :start_date => "2020-02-25",
                              :start_time => "12:17",
                              :end_date => "2020-03-24",
                              :end_time => "13:00")
        month_29 = Factory(:event, :start_date => "2020-02-25",
                           :start_time => "12:18",
                           :end_date => "2020-03-26",
                           :end_time => "11:00")
        no_month_30 = Factory(:event, :start_date => "2011-04-25",
                              :start_time => "10:17",
                              :end_date => "2011-05-24",
                              :end_time => "13:00")
        month_30 = Factory(:event, :start_date => "2011-04-25",
                           :start_time => "11:59",
                           :end_date => "2011-05-26",
                           :end_time => "11:00")
        no_month_31 = Factory(:event, :start_date => "2011-05-25",
                              :start_time => "12:01",
                              :end_date => "2011-06-24",
                              :end_time => "13:00")
        month_31 = Factory(:event, :start_date => "2011-05-25",
                           :start_time => "12:03",
                           :end_date => "2011-06-26",
                           :end_time => "11:00")
        no_month_28.when.should eq "2月25日 12:20-24日 13:00"
        month_28.when.should eq "2月25日 12:21-3月26日 11:00"
        no_month_29.when.should eq "2020年2月25日 12:17-24日 13:00"
        month_29.when.should eq "2020年2月25日 12:18-3月26日 11:00"
        no_month_30.when.should eq "4月25日 10:17-24日 13:00"
        month_30.when.should eq "4月25日 11:59-5月26日 11:00"
        no_month_31.when.should eq "5月25日 12:01-24日 13:00"
        month_31.when.should eq "5月25日 12:03-6月26日 11:00"
      end
      it "should not contain month if diff is less than a month(hours)" do
        no_month = Factory(:event, :start_date => "2011-04-25",
                           :start_time => "10:25",
                           :end_date => "2011-05-25",
                           :end_time => "9:00")
        month = Factory(:event, :start_date => "2011-04-25",
                        :start_time => "11:56",
                        :end_date => "2011-05-25",
                        :end_time => "11:57")
        no_month.when.should eq "4月25日 10:25-25日 09:00"
        month.when.should eq "4月25日 11:56-5月25日 11:57"
      end
      it "should not contain year if diff is less than a year" do
        no_year_month = Factory(:event, :start_date => "2011-04-25",
                                :start_time => "13:01",
                                :end_date => "2012-03-26",
                                :end_time => "9:00")
        year_month = Factory(:event, :start_date => "2011-04-25",
                             :start_time => "13:02",
                             :end_date => "2012-05-24",
                             :end_time => "11:00")
        no_year_day = Factory(:event, :start_date => "2011-04-25",
                              :start_time => "13:11",
                              :end_date => "2012-04-24",
                              :end_time => "14:00")
        year_day = Factory(:event, :start_date => "2011-04-25",
                           :start_time => "13:12",
                           :end_date => "2012-04-26",
                           :end_time => "11:00")
        no_year_month.when.should eq "4月25日 13:01-3月26日 09:00"
        year_month.when.should eq "4月25日 13:02-2012年5月24日 11:00"
        no_year_day.when.should eq "4月25日 13:11-4月24日 14:00"
        year_day.when.should eq "4月25日 13:12-2012年4月26日 11:00"

      end

      it "should skip time if time is not set" do
        event = Factory(:event, :start_date => "2011-04-25",
                        :end_date => "2011-04-26")
        event.when.should eq "4月25日-26日"
      end
    end

    describe "one date" do
      it "should display date according to existing start data" do
        year = Factory(:event, :start_date => "2012-01-01")
        full = Factory(:event, :start_date => "2011-04-25",
                       :start_time => "13:21")
        no_min = Factory(:event, :start_date => "2011-04-25",
                         :start_time => "13")
        no_time = Factory(:event, :start_date => "2011-04-25")
        year.when.should eq "2012年1月1日"
        full.when.should eq "4月25日 13:21"
        no_min.when.should eq "4月25日 13:00"
        no_time.when.should eq "4月25日"
      end

      it "should display date according to existing end data" do
        year = Factory(:event, :end_date => "2012-01-01")
        full = Factory(:event, :end_date => "2011-04-25",
                       :end_time => "13:21")
        no_min = Factory(:event, :end_date => "2011-04-25",
                         :end_time => "13")
        no_time = Factory(:event, :end_date => "2011-04-25")
        year.when.should eq "2012年1月1日"
        full.when.should eq "4月25日 13:21"
        no_min.when.should eq "4月25日 13:00"
        no_time.when.should eq "4月25日"
      end

      it "should return only start if end does not exist" do
        event = Factory(:event, :start_date => "2011-04-24",
                        :start_time => "14:20")
        event.when.should eq "4月24日 14:20"
      end
      it "should return only end if start does not exist" do
        event = Factory(:event, :end_date => "2011-04-24",
                        :end_time => "14:24")
        event.when.should eq "4月24日 14:24"
      end
    end

    describe "one date and one/two time" do
      it "should work" do
        sdet = Factory(:event, :start_date => "2011-04-25",
                        :end_time => "14:26")
        sdstet = Factory(:event, :start_date => "2011-04-25",
                        :start_time => "14:29",
                         :end_time => "14:30")
        sted = Factory(:event, :start_time => "14:46",
                       :end_date => "2011-04-25")
        sdet.when.should eq "4月25日 14:26"
        sdstet.when.should eq "4月25日 14:29-14:30"
        sted.when.should eq "4月25日 14:46"
      end
    end
    
    describe "no date" do
      it "should return default" do
        event = Factory(:event)
        event.when.should eq "まだ発表されていません"
      end
    end
  end
end

# == Schema Information
#
# Table name: events
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  start_date :date
#  end_date   :date
#  start_time :time
#  end_time   :time
#  content    :text
#

