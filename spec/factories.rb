Factory.define :server do |f|
  f.sequence(:name) { |n| "foo#{n}" }
  f.description "= Markdown ''text'' ="
  f.sequence(:host_address) { |n| "host#{n}.example.com" }
end
