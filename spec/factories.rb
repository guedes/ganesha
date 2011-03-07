Factory.define :server do |f|
  f.sequence(:name) { |n| "foo#{n}" }
  f.description "= Markdown ''text'' ="
  f.sequence(:host_address) { |n| "host#{n}.example.com" }
end

Factory.define :instance do |f|
  f.sequence(:name) { |n| "instance#{n}" }
  f.description "= Markdown ''intance description''"
  f.port 5432
  f.association :server 
end

Factory.define :database do |f|
  f.name "mydatabase"
  f.description "My Cool Database :D"
  f.association :instance
end

Factory.define :data_collector do |f|
  f.name "my_data_collector"
  f.description "My Cool Data Collector :D"
  f.script "SELECT 1+1"
end

Factory.define :script do |f|
  f.name "my_script"
  f.description "My Cool Script :D"
  f.script "SELECT 1+1"
end

