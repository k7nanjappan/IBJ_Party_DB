CREATE TABLE t_party ( --パーティーテーブル
	party_id bigserial PRIMARY KEY, --パーティーID
	title text, --パーティー名
	start_ts timestamptz, --開催日時
    end_ts timestamptz, --終了日時
    place_id bigint, --会場ID
    price_man integer, --男性参加費
    price_woman integer --女性参加費	
);