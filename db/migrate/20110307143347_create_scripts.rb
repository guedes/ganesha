class CreateScripts < ActiveRecord::Migration
  def self.up
    create_table :scripts do |t|
      t.string :name
      t.text :description
      t.text :script

      t.timestamps
    end

    add_index :scripts, :name, :unique => true
  end

  def self.down
    drop_table :scripts
  end
end
