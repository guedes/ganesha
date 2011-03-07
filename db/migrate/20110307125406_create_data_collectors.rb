class CreateDataCollectors < ActiveRecord::Migration
  def self.up
    create_table :data_collectors do |t|
      t.string :name
      t.text :description
      t.text :script
      t.string :unit

      t.timestamps
    end

    add_index :data_collectors, :name, :unique => true
  end

  def self.down
    drop_table :data_collectors
  end
end
