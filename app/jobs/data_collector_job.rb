class TargetDatabase < ActiveRecord::Base
end

class DataCollectorJob
  @queue = :data_collector

    class << self

      def collect_all!
        ScriptTarget.all.each do |st|
          collect!(st)
        end
      end

      def collect!(script_target)
        Resque.enqueue(DataCollectorJob, script_target.id)
      end

      def perform(script_target_id)
        script_target = ScriptTarget.find(script_target_id)
        if script_target.script.type == ScriptType::SQL
          log("Collecting #{script_target.name}")

          cd = CollectedDatum.create!({
            :script_target => script_target,
            :result => collect_data(script_target)
          })

          log("Finished collecting #{script_target.name}")
          cd.result
        end
      end

      def log(text)
        text = "[ #{Time.now} ]: #{text}"

        puts text
        Rails.logger.info text
      end

      def collect_data(script_target)
        connection(build_options(script_target)).select_all(script_target.script.content)
      end

      def connection(options)
        TargetDatabase.establish_connection(options).connection
      end

      def build_options(script_target)
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
end
