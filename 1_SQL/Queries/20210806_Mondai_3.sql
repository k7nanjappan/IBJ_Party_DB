SELECT t_party.party_id AS パーティーID, 
t_party.title AS パーティー名,  
to_char(t_party.start_ts, 'YYYY/MM/DD hh24:mm') AS 開催日時
FROM t_party
WHERE (t_party.party_id) IN
	(SELECT t_party_member.party_id FROM t_party_member WHERE t_party.party_id = t_party_member.party_id AND
		(t_party_member.member_id) IN
	 		(SELECT t_member.member_id FROM t_member WHERE t_member.gender_kbn = '00101')
	) AND
	not (t_party.party_id) IN
	(SELECT t_party_member.party_id FROM t_party_member WHERE t_party.party_id = t_party_member.party_id AND
		(t_party_member.member_id) IN
	 		(SELECT t_member.member_id FROM t_member WHERE t_member.gender_kbn = '00102')
	)
GROUP BY t_party.party_id
ORDER BY t_party.party_id;