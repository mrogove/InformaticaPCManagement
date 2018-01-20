/*
	Hunt down any workflow where the failure e-mail (ref_obj_type=6) is not turned on (id=0)
	
	Adapted from forums; note verison number portion.
*/

SELECT DISTINCT task_id
			 ,  subject_area
			 ,  workflow_name
			 ,  instance_name 
FROM PC_REPO.rep_task_inst_run 
WHERE task_id IN 
    (SELECT task_id 
    FROM PC_REPO.OPB_COMPONENT 
    WHERE  ref_obj_type=6 
     AND ref_obj_id=0 
     AND (task_id,VERSION_NUMBER) IN (SELECT task_id,max(VERSION_NUMBER) 
                                     	FROM PC_REPO.OPB_COMPONENT  GROUP BY task_id)
	) 
ORDER BY 2,3,4