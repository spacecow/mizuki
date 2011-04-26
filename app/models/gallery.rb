class Gallery < ActiveRecord::Base
  attr_accessible :title, :description

  validates :title, :uniqueness => true
end
