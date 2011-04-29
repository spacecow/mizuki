class AddEventIdToGallery < ActiveRecord::Migration
  def self.up
    add_column :galleries, :event_id, :integer
  end

  def self.down
    remove_column :galleries, :event_id
  end
end
