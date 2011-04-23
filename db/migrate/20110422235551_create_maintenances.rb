class CreateMaintenances < ActiveRecord::Migration
  def self.up
    create_table :maintenances do |t|
      t.string :ip
      t.string :place

      t.timestamps
    end
  end

  def self.down
    drop_table :maintenances
  end
end
