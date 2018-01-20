/*
	Is the Truncate Table option being used?

   ATTR_ID values borrowed from forums.
*/
SELECT
   RAT.SUBJECT_AREA,
   TASK_NAME,
   'Truncate Target Table' ATTR,
   DECODE(ATTR_VALUE,1,'Yes','No') VALUE 
FROM PC_REPO.OPB_EXTN_ATTR OEA,
     PC_REPO.REP_ALL_TASKS RAT  
WHERE 
      OEA.SESSION_ID=RAT.TASK_ID 
      AND ATTR_ID=9
	  AND DECODE(ATTR_VALUE,1,'Yes','No') = 'No'
