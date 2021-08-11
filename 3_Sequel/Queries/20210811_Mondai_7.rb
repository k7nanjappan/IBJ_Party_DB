require "pg"
require "sequel"

DB = Sequel.postgres('IBJ',user:'postgres',password:'welcome123',host:'localhost',port:5432,max_connections: 10)

puts "\n"
puts "\n"
puts "\n"

DB['SELECT t_party.party_id AS パーティーID,
t_party.title AS パーティー名,
SUM(case when t_member.gender_kbn = \'00101\' AND t_party.party_id = t_party_member.party_id then 1 else 0 end) AS 男性参加者数,
SUM(case when t_member.gender_kbn = \'00102\' AND t_party.party_id = t_party_member.party_id then 1 else 0 end) AS 女性参加者数,
SUM(case when t_party.party_id = t_party_member.party_id then 1 else 0 end) AS 参加者総数,
SUM(case when t_member.gender_kbn = \'00101\' AND t_party.party_id = t_party_member.party_id then t_party.price_man else 0 end) AS 男性売上げ,
SUM(case when t_member.gender_kbn = \'00102\' AND t_party.party_id = t_party_member.party_id then t_party.price_woman else 0 end) AS 女性売上げ,
COALESCE(SUM(case when t_member.gender_kbn = \'00101\' AND t_party.party_id = t_party_member.party_id then t_party.price_man else 0 end),0) + 
COALESCE(SUM(case when t_member.gender_kbn = \'00102\' AND t_party.party_id = t_party_member.party_id then t_party.price_woman else 0 end),0) AS 総売上げ
FROM t_party, t_member, t_party_member
WHERE t_party_member.member_id = t_member.member_id
GROUP BY t_party.party_id;'].each do |row|
    p row
end

puts "\n"
puts "\n"
puts "\n"
