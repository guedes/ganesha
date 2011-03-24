class CreateCollectedData < ActiveRecord::Migration
  def self.up
    create_table :collected_data do |t|
      t.references :script_target
      t.string :result

      t.timestamps
    end
  end

  def self.down
    drop_table :collected_data
  end
end
