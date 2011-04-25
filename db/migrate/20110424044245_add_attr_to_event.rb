class AddAttrToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_column :events, :content, :text
  end

  def self.down
    remove_column :events, :content
    remove_column :events, :end_date
    remove_column :events, :start_date
    remove_column :events, :end_time
    remove_column :events, :start_time
  end
end
