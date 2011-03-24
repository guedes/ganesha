module CollectedDataHelper
  # from ...
  # http://stackoverflow.com/questions/2634024/generate-an-html-table-from-an-array-of-hashes-in-ruby
  # http://builder.rubyforge.org/classes/Builder/XmlMarkup.html
  def show_formated_collected_data
    data = @collected_datum.result
    builder = Builder::XmlMarkup.new(:indent => 2)
    builder.table do
      builder.tr { data[0].keys.each { |columns| builder.th(columns) } }
      data.each { |row| builder.tr { row.values.each { |value| builder.td(value) } } }
    end
    concat(raw builder.p)
  end
end
