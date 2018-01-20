/*
	Adapted from Informatica forums - 
	determine whether a Pre or Post SQL error will allow a given mapping to continue or not.

	Used extensively during debugging/testing.
*/

SELECT DISTINCT
	A.SUBJECT_AREA
, 	A.TASK_NAME AS SESSION_NAME
, 	B.ATTR_NAME
, 	CASE B.ATTR_VALUE 
		WHEN '1' THEN 'CONTINUE' 
		ELSE 'STOP' END AS OnPrePostSqlError
FROM
	PC_REPO.REP_ALL_TASKS A 
, 	PC_REPO.REP_SESS_CONFIG_PARM  B
WHERE
	A.TASK_ID = B.SESSION_ID
	AND TASK_TYPE_NAME = 'Session' 
	AND B.ATTR_ID = '207'
	AND B.ATTR_NAME = ('On Pre-Post SQL error')
	AND b.attr_value = '0'
ORDER BY 4 DESC, 1 DESC, 2 ASC
