SELECT 
agency_cd, 
history_ts, 
regist_ts 
FROM t_agency_all 
WHERE history_ts IS NOT NULL AND regist_ts IS NOT NULL 
ORDER BY agency_cd;