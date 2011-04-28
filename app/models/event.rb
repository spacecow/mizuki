# -*- coding: utf-8 -*-
require 'date'

class Event < ActiveRecord::Base
  include When
  attr_accessible :name, :start_date, :end_date, :start_time, :end_time, :content
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

