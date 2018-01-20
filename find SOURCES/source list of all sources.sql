/*
  LIST SOURCES

  This query can be used to determine details of a listed source.
  E.g.: find all mappings that are directly and primarily based on Table XXXXX

  Accurate as of Informatica 9.6
*/

SELECT
B.SUBJ_NAME,
C.DBDNAM,
D.DBTYPE_NAME,
A.SOURCE_NAME AS TABLE_NAME,
A.FILE_NAME SCHEMA_NAME,
A.OWNERNAME
FROM
	PC_REPO.OPB_SRC A
  , PC_REPO.OPB_SUBJECT B
  , PC_REPO.OPB_DBD C
  , PC_REPO.OPB_MMD_DBTYPE D
WHERE A.SUBJ_ID = B.SUBJ_ID
AND A.DBDID = C.DBDID
AND C.DBTYPE = D.DBTYPE_ID
AND A.SOURCE_NAME IN(
'TABLENAME1','TABLENAME2'
 )
ORDER BY 1,2,3,4,5