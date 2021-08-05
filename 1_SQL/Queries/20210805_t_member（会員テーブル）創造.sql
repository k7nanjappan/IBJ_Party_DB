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