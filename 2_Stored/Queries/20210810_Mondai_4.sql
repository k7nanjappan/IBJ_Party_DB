CREATE or REPLACE function Mondai_4_20210810() RETURNS TABLE (
		会員CD text,
	    パーティー参加回数 bigint)
	AS $$
	
    BEGIN
      RETURN QUERY 
	  	SELECT t_member.member_cd AS 会員CD, count(t_party_member.member_id) AS パーティー参加回数 
        FROM t_member, t_party_member 
        WHERE t_member.member_id = t_party_member.member_id
        GROUP BY t_member.member_cd;
	END $$ 
language plpgsql;