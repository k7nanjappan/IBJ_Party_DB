require "pg"
require "sequel"

DB = Sequel.postgres('IBJ',user:'postgres',password:'welcome123',host:'localhost',port:5432,max_connections: 10)

puts "\n"
puts "\n"
puts "\n"

# DB['SELECT member_cd AS 会員CD,
# gender_kbn AS 性別区分, 
# family_kj AS 名前, 
# to_char(date(birthday_ts), \'YYYY/MM/DD\') AS 誕生日 
# FROM t_member 
# WHERE member_id IN (2, 3, 4)'].each do |row|
#     p row
# end

puts DB[:t_member].select(Sequel.as(:member_cd,:会員CD), 
Sequel.as(Sequel.case({{gender_kbn: ['00101']} => '男性'},'女性'),:性別), 
Sequel.as(:family_kj, :名前))
.select_more{to_char(:birthday_ts, 'YYYY/MM/DD').as(:誕生日)}.where(:member_id => [2,3,4]).all

puts "\n"
puts "\n"
puts "\n"
