/*
	What datatypes are you using in your mappings?
		developed as part of a standardization project.

	Accurate as of Informatica Powercenter 9.6
*/
SELECT DISTINCT t.PARENT_SUBJECT_AREA
			  , t.PARENT_TARGET_NAME
			  , t.TARGET_FIELD_DATATYPE
			  , t.TARGET_field_name
			  , t.TARGET_FIELD_PRECISION
			  , t.target_field_scale
FROM PC_REPO.REP_ALL_TARGET_FLDS t
WHERE 1 = 1
--AND t.PARENT_SUBJECT_AREA not like 'WRK%' --omit working group
order by 1 desc,2 asc;