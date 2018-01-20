/*
	TARGET FIELD TYPE

	This returns, where applicable, the precision and scale of a given datatype are set.

	Used primarily in standardization effort; strict typing required to ensure data preserved.

	Accurate as of Informatica Powercenter 9.6
*/

SELECT DISTINCT t.PARENT_SUBJECT_AREA
			  , t.PARENT_TARGET_NAME
			  , t.TARGET_FIELD_DATATYPE
			  , t.TARGET_FIELD_NAME
			  , t.TARGET_FIELD_PRECISION
			  , t.TARGET_FIELD_SCALE
FROM PC_REPO.REP_ALL_TARGET_FLDS t
WHERE 1 = 1
AND upper(t.TARGET_FIELD_DATATYPE) = 'NUMBER(P,S)'
--AND t.PARENT_SUBJECT_AREA not like 'WRK%' --omit working directory
--AND t.TARGET_FIELD_PRECISION IS NOT NULL --is this intended?
--AND t.TARGET_FIELD_SCALE = 0 --how about your scale? Appropriate?
ORDER BY 1 DESC,2 ASC;