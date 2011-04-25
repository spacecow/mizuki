class AddAttrToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
    add_column :events, :content, :text
  end

  def self.down
    remove_column :events, :content
    remove_column :events, :end
    remove_column :events, :start
  end
end
