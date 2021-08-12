require "pg"
require "sequel"

DB = Sequel.postgres('IBJ',user:'postgres',password:'welcome123',host:'localhost',port:5432,max_connections: 10)

puts "\n"
puts "\n"
puts "\n"

# DB['SELECT t_party.party_id AS パーティーID,
# t_party.title AS パーティー名,
# to_char(date(t_party.start_ts), \'YYYY/MM/DD\') AS 開催日時,
# to_char(date(t_party.end_ts), \'YYYY/MM/DD\') AS 終了日時,
# t_place.name AS 会場名,
# t_place.address AS 住所,
# t_member.member_cd AS 会員CD,
# CASE WHEN t_member.gender_kbn = \'00101\' THEN \'男性\'
# ELSE \'女性\'
# END AS 性別,
# CONCAT(family_kj, first_kj) AS 名前,
# EXTRACT(YEAR FROM age(birthday_ts)) AS 年齢 
# FROM t_party, t_member, t_party_member, t_place
# WHERE t_party.party_id = t_party_member.party_id AND t_member.member_id = t_party_member.member_id AND t_party.place_id = t_place.place_id
# ORDER BY t_party.party_id;'].each do |row|
#     p row
# end


puts DB[:t_place]
.inner_join(:t_party, place_id: :place_id)
.inner_join(:t_party_member, party_id: :party_id)
.inner_join(:t_member, member_id: :member_id)
.select(Sequel.as(Sequel[:t_party_member][:party_id], :パーティーID), 
Sequel[:title].as(:パーティー名))
.select_more{to_char(:start_ts, 'YYYY/MM/DD HH24:MI').as(:開催日時)}
.select_more{to_char(:end_ts, 'YYYY/MM/DD HH24:MI').as(:終了日時)}
.select_more{Sequel[:name].as(:会場名)}
.select_more{Sequel[:address].as(:住所)}
.select_more{Sequel[:member_cd].as(:会員CD)}
.select_more{Sequel.as(Sequel.case({{gender_kbn: ['00101']} => '男性'},'女性'),:性別)}
.select_more{Sequel.join([:family_kj, :first_kj]).as(:名前)}
.select_more{Sequel.as(Date.today.year - Sequel.extract(:year,:birthday_ts),:年齢)}
.order(Sequel[:t_party_member][:party_id]).all

puts "\n"
puts "\n"
puts "\n"
