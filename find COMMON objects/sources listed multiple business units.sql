
/*
  SOURCES TO THE SAME DB IN MULTIPLE BUSINESS UNITS

  In an ETL segmented by business units, it's crucial to understand if common sources are being used across business units.
  Those are the "COMMON" objects referenced elsewhere in this repo.

  Informatica PC 9.6
*/
SELECT
COUNT(B.SUBJ_NAME)
, C.DBDNAM
, D.DBTYPE_NAME
, A.SOURCE_NAME AS TABLE_NAME --this is your 
, A.FILE_NAME SCHEMA_NAME
FROM
  PC_REPO.OPB_SRC A
, PC_REPO.OPB_SUBJECT B
, PC_REPO.OPB_DBD C
, PC_REPO.OPB_MMD_DBTYPE D
WHERE A.SUBJ_ID = B.SUBJ_ID
AND A.DBDID = C.DBDID
AND C.DBTYPE = D.DBTYPE_ID
--and B.SUBJ_NAME NOT LIKE 'WRK%'
--AND A.SOURCE_NAME IN() --YOUR SOURCE NAME HERE for ad-hoc queries
GROUP BY A.SOURCE_NAME, C.DBDNAM,A.FILE_NAME
having count(b.subj_name)>1
ORDER BY 1 desc,2,3,4;



-- this will uncover the source IDs
select count(distinct m.SOURCE_NAME || m.SOURCE_ID)
	 , m.SOURCE_NAME
FROM PC_REPO.REP_SRC_MAPPING m
WHERE SUBJECT_AREA NOT LIKE 'WRK%'
AND m.source_name <> 'DUAL'
GROUP BY m.source_name
ORDER BY 1 DESC, 2

