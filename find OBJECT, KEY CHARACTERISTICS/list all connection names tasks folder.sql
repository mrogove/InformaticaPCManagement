/*
  Misc. query to return list of folder-->tasks-->connection name
*/
SELECT DISTINCT
  A.SUBJECT_AREA,
  A.TASK_NAME,
  B.CNX_NAME
FROM
  PC_REPO.REP_ALL_TASKS A,
  PC_REPO.REP_SESS_WIDGET_CNXS B
WHERE
  A.TASK_ID = B.SESSION_ID
  --and a.SUBJECT_AREA NOT LIKE 'WRK%' --omit working directory
ORDER BY 
  3 desc,1,2
