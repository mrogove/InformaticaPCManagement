/*
	Determine full status of REP_WFLOW_RUN's last 5 runs
		Accurate as of Informatica 9.6

	Plug in to dynamic SQL, workflows, code, or for use in one-off research.
*/

SELECT *
FROM PC_REPO.REP_WFLOW_RUN
WHERE WORKFLOW_NAME LIKE '%%' AND rownum < 6
ORDER BY WORKFLOW_RUN_ID DESC