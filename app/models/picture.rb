class Picture < ActiveRecord::Base
  belongs_to :gallery

  attr_accessible :file, :caption, :gallery
  mount_uploader :file, PictureUploader

  def filename; file.file.filename end
end
