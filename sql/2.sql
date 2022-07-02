SELECT tamir_yeri.tamir_yeri, SUM(tamir.tamir_yeri_id) FROM tamir	
LEFT JOIN tamir_yeri ON tamir_yeri.id = tamir.tamir_yeri_id
GROUP BY MONTH(tamir.created_at)