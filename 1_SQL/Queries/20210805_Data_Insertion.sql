
--パーティーテーブル:
INSERT INTO t_party (party_id, title, start_ts, end_ts, place_id, price_man, price_woman) VALUES (1, '男女20代限定パーティー', '2018-05-18 14:00:00', '2018/05/18 15:30:00', 3, 3000, 2000);
INSERT INTO t_party (party_id, title, start_ts, end_ts, place_id, price_man, price_woman) VALUES (2, '料理好き集まれ！クッキングパーティー', '2018-05-19 16:00:00', '2018/05/19 18:00:00', 1, 4000, 3000);
INSERT INTO t_party (party_id, title, start_ts, end_ts, place_id, price_man, price_woman) VALUES (3, '1年以内に結婚したい30代限定パーティー', '2018-05-20 10:00:00', '2018/05/20 12:00:00', 2, 4000, 3000);
INSERT INTO t_party (party_id, title, start_ts, end_ts, place_id, price_man, price_woman) VALUES (4, 'BBQ婚活パーティー', '2018-05-26 11:00:00', '2018/05/26 14:00:00', 4, 5000, 4000);


--会場テーブル
INSERT INTO t_place (place_id, name, address) VALUES (1, '新宿パーティー会場', '東京都新宿区西新宿1-2-3');
INSERT INTO t_place (place_id, name, address) VALUES (2, '恵比寿パーティー会場', '東京都渋谷区恵比寿5-5');
INSERT INTO t_place (place_id, name, address) VALUES (3, '有楽町パーティー会場', '東京都千代田区有楽町8-1');
INSERT INTO t_place (place_id, name, address) VALUES (4, '鎌倉パーティー会場', '神奈川県鎌倉市1-1');
INSERT INTO t_place (place_id, name, address) VALUES (5, '京都パーティー会場', '京都府中京区1-8');
INSERT INTO t_place (place_id, name, address) VALUES (6, '伊豆パーティー会場', '神奈川県伊豆市9-123');
INSERT INTO t_place (place_id, name, address) VALUES (7, '横浜パーティー会場', '神奈川県横浜市6-456');


--パーティー参加者テーブル
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (1, 3, 1);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (2, 3, 4);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (3, 1, 6);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (4, 3, 7);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (5, 2, 4);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (6, 2, 6);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (7, 2, 1);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (8, 2, 5);
INSERT INTO t_party_member (party_member_id, party_id, member_id) VALUES (9, 1, 7);


--会員テーブル
INSERT INTO t_member (member_id, member_cd, gender_kbn, family_kj, first_kj, family_kn, first_kn, birthday_ts) VALUES (1, 'M88035', '00101', '山田', '太郎', 'やまだ', 'たろう', '1982-02-02 0:00:00');
INSERT INTO t_member (member_id, member_cd, gender_kbn, family_kj, first_kj, family_kn, first_kn, birthday_ts) VALUES (2, 'M24333', '00101', '佐藤', '宏', 'さとう', 'ひろし', '1991-08-16 0:00:00');
INSERT INTO t_member (member_id, member_cd, gender_kbn, family_kj, first_kj, family_kn, first_kn, birthday_ts) VALUES (3, 'F12414', '00102', '田中', '花子', 'たなか', 'はなこ', '1990-05-11 0:00:00');
INSERT INTO t_member (member_id, member_cd, gender_kbn, family_kj, first_kj, family_kn, first_kn, birthday_ts) VALUES (4, 'M96432', '00101', '佐々木', '大輔', 'ささき', 'だいすけ', '1980-10-09 0:00:00');
INSERT INTO t_member (member_id, member_cd, gender_kbn, family_kj, first_kj, family_kn, first_kn, birthday_ts) VALUES (5, 'F42677', '00102', '上野', '愛', 'うえの', 'あい', '1988-12-23 0:00:00');
INSERT INTO t_member (member_id, member_cd, gender_kbn, family_kj, first_kj, family_kn, first_kn, birthday_ts) VALUES (6, 'F55543', '00102', '遠藤', '裕美', 'えんどう', 'ゆみ', '1992-03-30 0:00:00');
INSERT INTO t_member (member_id, member_cd, gender_kbn, family_kj, first_kj, family_kn, first_kn, birthday_ts) VALUES (7, 'M36945', '00101', '前田', '三郎', 'まえだ', 'さぶろう', '1985-05-02 0:00:00');


