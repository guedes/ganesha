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

Factory.define :script_target do |f|
  f.association :script
  f.association :targetable, :factory => :database
end

Factory.define :script_target_instance, :class => ScriptTarget do |f|
  f.association :script
  f.association :targetable, :factory => :instance
end

Factory.define :script_target_server, :class => ScriptTarget do |f|
  f.association :script
  f.association :targetable, :factory => :server
end

Factory.define :script do |f|
  f.sequence(:name) { |n| "my_script#{n}" }
  f.description "My Cool Script :D"
  f.content "SELECT 1+1"
end

