require "pg"
require "sequel"
require 'date'

DB = Sequel.postgres('IBJ',user:'postgres',password:'welcome123',host:'localhost',port:5432,max_connections: 10)

puts "\n"
puts "\n"
puts "\n"

# DB['SELECT member_cd AS 会員CD,
# CASE WHEN gender_kbn = \'00101\' THEN \'男性\'
# ELSE \'女性\'
# END AS 性別区分,
# CONCAT(family_kn, first_kn) AS 名前,
# EXTRACT(YEAR FROM age(birthday_ts)) AS 年齢 
# FROM t_member WHERE gender_kbn = \'00102\' AND EXTRACT(YEAR FROM age(birthday_ts)) >= 30;'].each do |row|
#     p row
# end

puts DB[:t_member].select(Sequel.as(:member_cd,:会員CD), 
Sequel.as(Sequel.case({{gender_kbn: ['00101']} => '男性'},'女性'),:性別), 
Sequel.as(Sequel.join([:family_kn, :first_kn]),:名前),
Sequel.as(Date.today.year - Sequel.extract(:year,:birthday_ts),:年齢)).where(Date.today.year - Sequel.extract(:year,:birthday_ts) >= 30).where(:gender_kbn => '00102').all

puts "\n"
puts "\n"
puts "\n"
