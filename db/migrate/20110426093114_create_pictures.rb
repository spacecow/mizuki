class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :file
      t.string :caption
      t.integer :gallery_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
