# -*- coding: utf-8 -*-
require 'date'

class Event < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date, :content

  DAY = 24*60*60
  
  def when
    ret = ""
    if start_date
      ret += "#{start_date_format(start_date)}"
      ret += "-#{end_date_format(end_date,start_date)}" if end_date
    elsif end_date
      ret += "#{start_date_format(end_date)}"
    end
    ret
  end

  private
    def days_in_year(d=Date.today)
      return Date.new(d.year+1)-Date.new(d.year) if d < Date.new(d.year,2,28)
      Date.new(d.year+2)-Date.new(d.year+1)
    end
    def days_in_month(d=Date.today)
      (Date.new(d.year,12,31) << (12-d.month)).day
    end
    def day(d); d.day.to_s+"日" end
    def end_date_format(d,ref)
      ret = ""
      ret += "#{year(d)}" if d-ref > days_in_year(ref)*DAY
      ret += "#{month(d)}" if d-ref > days_in_month(ref)*DAY
      ret += "#{day(d)} " if d-ref > DAY
      ret + time(d)
    end
    def month(d); I18n.t('date.abbr_month_names')[month_no(d)] end
    def month_no(d); d.strftime("%m").to_i end
    def start_date_format(d); "#{month(d)}#{day(d)} #{time(d)}" end
    def time(d); d.strftime("%H:%M") end
    def year(d); d.year.to_s+"年" end
end

  

  
