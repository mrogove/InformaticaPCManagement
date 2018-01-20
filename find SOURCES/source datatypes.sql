/*
	What datatypes are you using in your mappings?
		developed as part of a standardization project.

	Accurate as of Informatica Powercenter 9.6
*/

SELECT DISTINCT
sf.subject_area
, sf.source_database_name 
, sf.SOURCE_NAME
, sf.source_field_name
, sf.source_field_datatype
, sf.source_field_key_type
, sf.SOURCE_FIELD_PRECISION
, sf.SOURCE_FIELD_SCALE

FROM PC_REPO.REP_ALL_SOURCE_FLDS sf
where 1=1
--and sf.SUBJECT_AREA NOT LIKE 'WRK%' --omit working directories
--and sf.SOURCE_NAME not like 'Shortcut_to%' --omit shortcuts/pointers for brevity's sake
--AND upper(sf.SOURCE_DATABASE_NAME) <> 'BADDATABASE' --omit specific source
order by 2,3,1,4