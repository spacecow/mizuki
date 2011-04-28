class Picture < ActiveRecord::Base
  belongs_to :gallery

  attr_accessible :file, :caption, :gallery
  mount_uploader :file, PictureUploader

  validates :gallery, :presence => true
  
  def filename; file.file.filename end
end

# == Schema Information
#
# Table name: pictures
#
#  id         :integer(4)      not null, primary key
#  file       :string(255)
#  caption    :string(255)
#  gallery_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

