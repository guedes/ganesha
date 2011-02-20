class CreateInstances < ActiveRecord::Migration
  def self.up
    create_table :instances do |t|
      t.string :name
      t.text :description
      t.integer :port, :default => 5432
      t.references :server

      t.timestamps
    end
  end

  def self.down
    drop_table :instances
  end
end
