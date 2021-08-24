require "pg"
require "sequel"

DB = Sequel.postgres('IBJ',user:'postgres',password:'welcome123',host:'localhost',port:5432,max_connections: 10)

puts "\n"
puts "\n"
puts "\n"

# DB['SELECT t_party.party_id AS パーティーID, 
# t_party.title AS パーティー名, 
# to_char(t_party.start_ts, \'YYYY/MM/DD  HH24:MI\') as 開催日時 
# FROM t_party
# INNER JOIN t_party_member on (t_party.party_id = t_party_member.party_id)
# INNER JOIN t_member on (t_party_member.member_id = t_member.member_id)
# GROUP BY t_party.party_id
# HAVING SUM(CASE WHEN t_member.gender_kbn = \'00102\' AND t_party.party_id = t_party_member.party_id then 1 else 0 end) = 0;'].each do |row|
#     p row
# end

puts DB[:t_party].select(Sequel.as(Sequel[:t_party][:party_id],:パーティーID), 
Sequel.as(Sequel[:t_party][:title], :パーティー名))
.select_more{to_char(:start_ts, 'YYYY/MM/DD HH24:MI').as(:誕生日)}
.join(:t_party_member, party_id: :party_id)
.join(:t_member, member_id: :member_id)
.group(Sequel[:t_party][:party_id])
.order(Sequel[:t_party][:party_id])
.having{SUM(Sequel.case({{gender_kbn: ['00102']} => 1},0)) <= 0}
.all

puts "\n"
puts "\n"
puts "\n"
