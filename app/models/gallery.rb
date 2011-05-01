class Gallery < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
  belongs_to :event
  
  attr_accessible :title, :description, :event_id

  validates :title, :uniqueness => true, :presence => true
end


# == Schema Information
#
# Table name: galleries
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  event_id    :integer(4)
#

