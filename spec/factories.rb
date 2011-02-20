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
