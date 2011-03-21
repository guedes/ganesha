class DataCollectorJob
  @queue = :data_collector
  
  def self.perform(script_target_id)
    puts "Executing #{ScriptTarget.find(script_target_id).name}"
    sleep 3
    puts "Executed"
  end
end
