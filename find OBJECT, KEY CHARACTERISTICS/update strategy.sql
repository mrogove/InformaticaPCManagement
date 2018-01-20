/*
	Update Strategy can have significant performance/data impacts. 

     This is to return the update strategy mapping transformation expression.

     Informatica PC 9.6.1
*/

SELECT DISTINCT 
	c.subj_name
	, e.mapping_name
	, a.widget_name
	, b.attr_value
FROM   pc_repo.opb_widget a 
     , pc_repo.opb_widget_attr b
     , pc_repo.opb_subject c
     , pc_repo.opb_widget_inst d
     , pc_repo.opb_mapping e
WHERE a.widget_type = 4 --only in these
AND a.widget_id = b.widget_id
AND a.widget_id = d.widget_id
AND b.attr_id = 1
AND a.subject_id = c.subj_id
AND e.mapping_id = d.mapping_id
AND a.widget_name like '%INSERT'
AND b.attr_value <> 'DD_INSERT' --or, you know, != 'DD_INSERT'

order by 1, 4, 2