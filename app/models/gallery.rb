class Gallery < ActiveRecord::Base
  has_many :pictures

  attr_accessible :title, :description

  validates :title, :uniqueness => true
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
#

