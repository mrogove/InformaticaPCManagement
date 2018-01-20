/*
	Workflows not run on a particular date.
	Can be joined to CONTROL table or other lists if needed.

	Best used for reporting; was adapted for monitoring.

	Informatica PC 9.6
*/

SELECT DISTINCT SUBJECT_AREA 
, WORKFLOW_NAME 

FROM PC_REPO.REP_TASK_INST_RUN 
WHERE WORKFLOW_NAME NOT IN 
(SELECT WORKFLOW_NAME FROM PC_REPO.REP_TASK_INST_RUN 
	WHERE START_TIME > SYSDATE - 1 ) -- adjust date here

ORDER BY 1,2