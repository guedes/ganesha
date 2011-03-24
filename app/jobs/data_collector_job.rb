class TargetDatabase < ActiveRecord::Base
end

class DataCollectorJob
  
  @queue = :data_collector
  
  def self.perform(script_target_id)
    st = ScriptTarget.find(script_target_id)
    if st.script.type == ScriptType::SQL
      self.log("Collecting #{st.name}")

      cd = CollectedDatum.create!({
        :script_target => st,
        :result => self.select(st)
      })

      self.log("Finished collecting #{st.name}")
      cd.result
    end
  end

  private
    def self.log(text)
      text = "[ #{Time.now} ]: #{text}"

      puts text
      Rails.logger.info text
    end

    def self.select(st)
      self.connection(self.build_options(st)).select_all(st.script.content)
    end

    def self.connection(options)
      TargetDatabase.establish_connection(options).connection
    end

    def self.build_options(script_target)
      database = script_target.targetable
      instance = database.instance
      server   = instance.server

      options={
      :adapter  => "postgresql",
      :database => database.name,
      :port     => instance.port,
      :host     => server.host_address,
      :username => "monitor",
      :password => "monitor"
      }
    end
end
