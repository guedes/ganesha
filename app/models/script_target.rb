class ScriptTarget < ActiveRecord::Base
  belongs_to :script, :include => true
  belongs_to :targetable, :polymorphic => true

  has_many :collected_data, :dependent => :destroy, :include => true

  validates_presence_of :script, :targetable

  validates_uniqueness_of :script_id, :scope => [ :targetable_id, :targetable_type ]

  delegate :name, :type, :to => :script, :prefix => true
  delegate :name, :to => :targetable, :prefix => true

  def name
    "#{script_name} on #{targetable_name}"
  end

  def targetable_attributes=(targetable_attributes)
    unless targetable_attributes['targetable_id'].empty? or targetable_attributes['targetable_type'].empty?
      target_class = targetable_attributes['targetable_type'].classify.constantize
      target_id    = targetable_attributes['targetable_id'].to_i
      self.targetable   = target_class.find(target_id)
    end
  end

  def normalized_collected_data(date_start="", date_end="")
    date_start = 1.hours.ago if date_start.empty?
    date_end   = Time.now if date_end.empty?

    date_start = date_start.to_datetime.at_midnight
    date_end = date_end.to_datetime + 1.day - 1.second

    if collected_data.first.result.count > 1
      collected_data.where(:created_at => date_start..date_end).collect do |cd|
        {
          :executed_at => cd.created_at,
          :result => cd.result.collect do |r|
          { r[r.keys[0]] => r.values[1] }
          end
        }
      end
    else
      collected_data.where(:created_at => date_start..date_end).collect do |cd|
        {
          :executed_at => cd.created_at,
          :result => cd.result
        }
      end
    end
  end

  def chartified_data(date_start=nil, date_end=nil)
    result = { }
    normalized_collected_data(date_start, date_end).each do |nm|
      executed_at = nm[:executed_at]
      nm[:result].each do |nr|
        nr.each_pair do |key,value|
          result[key] ||= []
          result[key] << [ (executed_at - 3.hours).to_i * 1000, value.to_f ]
        end
      end
    end
    chartified = [ ]
    result.each_pair do |key,value|
      #chartified << { label: key, data: value }
      chartified << { data: value }
    end
    chartified
  end


  def chartified_data2(date_start=nil, date_end=nil)
    date_start ||= 1.hour.ago
    date_end   ||= Time.now


    {
      #label: name,
      data: normalized_collected_data(date_start, date_end).collect { |nd| [ nd[:executed_at].to_i * 1000, nd[:value] ] }
    }

    # first version
    #    {
    #      #label: name,
    #      data: normalized_collected_data(date_start, date_end).collect { |nd| [ nd[:executed_at].to_i * 1000, nd[:value] ] }
    #    }
  end
end
