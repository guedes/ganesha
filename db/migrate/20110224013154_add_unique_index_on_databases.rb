class AddUniqueIndexOnDatabases < ActiveRecord::Migration
  def self.up
    add_index :databases, [ :name, :instance_id ], :unique => true
  end

  def self.down
    remove_index :databases, [ :name, :instance_id ]
  end
end
