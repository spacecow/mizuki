# -*- coding: utf-8 -*-
require 'date'

class Event < ActiveRecord::Base
  include When
  attr_accessible :name, :start_date, :end_date, :start_time, :end_time, :content
end

  

  
