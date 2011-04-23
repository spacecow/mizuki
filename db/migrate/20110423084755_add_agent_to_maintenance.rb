class AddAgentToMaintenance < ActiveRecord::Migration
  def self.up
    add_column :maintenances, :agent, :string
  end

  def self.down
    remove_column :maintenances, :agent
  end
end
