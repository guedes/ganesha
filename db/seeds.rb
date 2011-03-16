# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

Script.create!({
  "name"=>"Total de tabelas",
  "description"=>"Retorna o total de tabelas da base de dados", 
  "content"=>"SELECT count(*) \r\nFROM pg_class \r\nWHERE relkind = 'r';"
})

Script.create!({
  "name"=>"Total de indices",
  "description"=>"Retorna o total de indices da base de dados", 
  "content"=>"SELECT count(*) \r\nFROM pg_class \r\nWHERE relkind = 'i';"
})

Script.create!({
  "name"=>"Total de visoes",
  "description"=>"Retorna o total de visoes da base de dados", 
  "content"=>"SELECT count(*) \r\nFROM pg_views"
})
