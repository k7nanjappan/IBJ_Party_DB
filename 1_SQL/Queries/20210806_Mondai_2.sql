SELECT member_cd AS 会員CD,
CASE WHEN gender_kbn = '00101' THEN '男性'
ELSE '女性'
END AS 性別区分,
CONCAT(family_kn, first_kn) AS 名前,
EXTRACT(YEAR FROM age(birthday_ts)) AS 年齢 
FROM t_member WHERE gender_kbn = '00102' AND EXTRACT(YEAR FROM age(birthday_ts)) >= 30;