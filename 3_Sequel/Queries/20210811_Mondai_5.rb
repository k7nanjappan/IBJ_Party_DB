require "pg"
require "sequel"

DB = Sequel.postgres('IBJ',user:'postgres',password:'welcome123',host:'localhost',port:5432,max_connections: 10)

puts "\n"
puts "\n"
puts "\n"

DB['SELECT t_member.member_cd AS 会員CD, count(t_party_member.member_id) AS パーティー参加回数 
FROM t_member
LEFT JOIN t_party_member  ON t_member.member_id = t_party_member.member_id 
GROUP BY t_member.member_cd
HAVING count(t_party_member.member_id) = 0;'].each do |row|
    p row
end

puts "\n"
puts "\n"
puts "\n"
