/*
	Return all session tasks in your repository.
*/

SELECT   SUBJECT_AREA
		, TASK_TYPE_NAME
		, TASK_NAME 
FROM PC_REPO.REP_ALL_TASKS
   WHERE TASK_TYPE IN (68) 
ORDER BY 1, 2, 3
