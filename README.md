test@test.com
123456

test kullanıcısı


-Tamir yerlerine göre ortalama tamire alım süresini (Tamir tarihi ile kayıt girme tarihi
arasındaki fark) saat bazında veren SQL.

SELECT tamir_yeri.tamir_yeri, SUM(TIMESTAMPDIFF(HOUR, tamir.created_at, tamir.tamir_tarihi))/COUNT(tamir.tamir_yeri_id) FROM tamir	
LEFT JOIN tamir_yeri ON tamir_yeri.id = tamir.tamir_yeri_id
GROUP BY tamir.tamir_yeri_id

-Ay bazında, tamir yerlerinin yoğunluğunu veren SQL

SELECT tamir_yeri.tamir_yeri, SUM(tamir.tamir_yeri_id) FROM tamir	
LEFT JOIN tamir_yeri ON tamir_yeri.id = tamir.tamir_yeri_id
GROUP BY MONTH(tamir.created_at)

-Araç sayılarını, hafta bazında ve araç segmenti (Araç modeli tablosunda tutulmalıdır) bazında
veren SQL

SELECT COUNT(arac_model.id) FROM tamir	
LEFT JOIN arac_model ON arac_model.id = tamir.model_id
GROUP BY WEEK(tamir.created_at)