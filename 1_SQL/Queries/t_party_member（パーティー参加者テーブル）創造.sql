CREATE TABLE t_party_member ( --パーティー参加者テーブル
    party_member_id bigserial PRIMARY KEY, --パーティー参加者ID
    party_id bigint, --パーティーID
    member_id bigint --会員ID
);