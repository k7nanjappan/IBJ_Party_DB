SELECT member_cd AS 会員CD, 
gender_kbn AS 性別区分, 
family_kj AS 名前, 
to_char(date(birthday_ts), 'DD/MM/YYYY') AS 誕生日 
FROM t_member 
WHERE member_id IN (2, 3, 4);