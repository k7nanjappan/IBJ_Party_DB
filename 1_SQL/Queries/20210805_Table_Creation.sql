CREATE TABLE t_party ( --パーティーテーブル
	party_id bigserial PRIMARY KEY, --パーティーID
	title text, --パーティー名
	start_ts timestamptz, --開催日時
    end_ts timestamptz, --終了日時
    place_id bigint, --会場ID
    price_man integer, --男性参加費
    price_woman integer --女性参加費	
);

CREATE TABLE t_place ( --会場テーブル
    place_id bigserial PRIMARY KEY, --会場ID
    name text, --会場名
    address text --住所
);

CREATE TABLE t_party_member ( --パーティー参加者テーブル
    party_member_id bigserial PRIMARY KEY, --パーティー参加者ID
    party_id bigint, --パーティーID
    member_id bigint --会員ID
);

CREATE TABLE t_member ( --会員テーブル
    member_id bigserial PRIMARY KEY, --会員ID
    member_cd text, --会員CD
    gender_kbn text, --性別区分
    family_kj text, --苗字_漢字
    first_kj text, --名前_漢字
    family_kn text, --苗字_かな
    first_kn text, --名前_かな
    birthday_ts timestamptz --誕生日
);