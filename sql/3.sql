SELECT COUNT(arac_model.id) FROM tamir	
LEFT JOIN arac_model ON arac_model.id = tamir.model_id
GROUP BY WEEK(tamir.created_at)