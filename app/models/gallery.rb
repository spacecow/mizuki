class Gallery < ActiveRecord::Base
  has_many :pictures

  attr_accessible :title, :description

  validates :title, :uniqueness => true
end
