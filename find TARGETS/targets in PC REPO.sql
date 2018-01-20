--FIND TARGETS
/*
	What types of DB connections do you have in your workflows?
		developed as part of a standardization project.

	Accurate as of Informatica Powercenter 9.6

	This was adapted from Informatica PC forums.
*/

SELECT B.SUBJ_NAME
, A.TARGET_NAME
, DECODE(A.DBTYPE
	, 0,'VSAM'
	, 1,'IMS'
	, 2,'Sybase'
	, 3,'Oracle'
	, 4,'Informix'
	, 5,'Microsoft SQL Server'
	, 6,'DB2'
	, 7,'Flat File'
	, 8,'ODBC'
	, 9,'SAP BW'
	, 10,'PeopleSoft'
	, 11,'SAP R/3'
	, 12,'XML'
	, 13,'MQSeries'
	, 14,'Siebel'
	, 15,'Teradata' ) as DB_TYP
FROM
PC_REPO.OPB_TARG A,
PC_REPO.OPB_SUBJECT B
WHERE A.SUBJ_ID = B.SUBJ_ID
--AND A.TARGET_NAME LIKE '%%' --arbitrary search string
ORDER BY 1,2,3