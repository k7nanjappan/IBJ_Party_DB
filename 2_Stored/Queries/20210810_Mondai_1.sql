CREATE or REPLACE function Mondai_1_20210810() RETURNS TABLE (
		会員CD text,
		性別区分 text,
		名前 text,
		誕生日 date)
	AS $$
	
    BEGIN
      RETURN QUERY 
	  	SELECT member_cd AS 会員CD, 
        gender_kbn AS 性別区分, 
        family_kj AS 名前, 
        cast(to_char(date(birthday_ts), 'YYYY/MM/DD') as date) AS 誕生日 
        FROM t_member 
        WHERE member_id IN (2, 3, 4);
	END $$ 
language plpgsql;