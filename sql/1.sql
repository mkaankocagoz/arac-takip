SELECT tamir_yeri.tamir_yeri, SUM(TIMESTAMPDIFF(HOUR, tamir.created_at, tamir.tamir_tarihi))/COUNT(tamir.tamir_yeri_id) FROM tamir	
LEFT JOIN tamir_yeri ON tamir_yeri.id = tamir.tamir_yeri_id
GROUP BY tamir.tamir_yeri_id