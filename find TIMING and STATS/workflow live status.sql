/*
	Very useful query; returns the status of a given workflow run.

	Was used in production in conjunction with dependency queries 
		to halt branches of the ETL with a failed upstream dependency.
		Critical to ETL orchestration workflows/"the scheduler"

	Informatica PC 9.6
*/

SELECT WORKFLOW_NAME,
SERVER_NAME,
RUN_ERR_CODE,
RUN_ERR_MSG,
SUBJECT_AREA,
decode (RUN_STATUS_CODE,1 , 'Succeeded',
2,'Disabled',
3,'Failed',
4,'Stopped',
5,'Aborted',
6,'Running',
15,'Terminated')  Status , REP_WFLOW_RUN.*
from PC_REPO.REP_WFLOW_RUN
where START_TIME>= sysdate-1 and END_TIME<=sysdate  and user_name =  '_svc_Informatica_Sch' --use admin svc account
