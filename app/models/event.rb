# -*- coding: utf-8 -*-
class Event < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date, :content

  def when
    ret = ""
    ret += "#{date_format(start_date)}" if start_date
    ret += "-#{end_time}" if end_date
    ret
  end

  private
    def date_format(d); "#{month(d)}#{start_day} #{start_time}" end
    def end_time; time_format(end_date) end
    def month(d); start_month end
    def start_day; start_date.strftime("%d")+"日" end
    def start_month; I18n.t('date.abbr_month_names')[start_month_no] end
    def start_month_no; start_date.strftime("%m").to_i end
    def start_time; time_format(start_date) end
    def time_format(d); d.strftime("%H:%M") end
end

  

  
