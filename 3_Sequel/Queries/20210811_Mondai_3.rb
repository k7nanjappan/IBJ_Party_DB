require "pg"
require "sequel"

DB = Sequel.postgres('IBJ',user:'postgres',password:'welcome123',host:'localhost',port:5432,max_connections: 10)

puts "\n"
puts "\n"
puts "\n"

DB['SELECT t_party.party_id AS パーティーID, 
t_party.title AS パーティー名,  
to_char(t_party.start_ts, \'YYYY/MM/DD hh24:mm\') AS 開催日時
FROM t_party  
INNER JOIN t_party_member ON t_party.party_id = t_party_member.party_id
INNER JOIN t_member ON t_member.gender_kbn = \'00101\'
AND
	(t_party.party_id) NOT IN
	(SELECT t_party_member.party_id FROM t_party_member 
	INNER JOIN t_member ON t_party_member.member_id = t_member.member_id
    WHERE gender_kbn = \'00102\')
GROUP BY t_party.party_id
ORDER BY t_party.party_id;'].each do |row|
    p row
end

puts "\n"
puts "\n"
puts "\n"
