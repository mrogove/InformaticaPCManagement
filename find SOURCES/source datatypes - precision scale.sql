/*
	This returns, where applicable, the precision and scale of a given datatype are set.

	Accurate as of Informatica Powercenter 9.6
*/

select distinct --*
sf.subject_area
, sf.source_database_name 
, sf.SOURCE_NAME
, sf.source_field_name
, sf.source_field_datatype
, sf.source_field_key_type
, sf.SOURCE_FIELD_PRECISION
, sf.SOURCE_FIELD_SCALE

FROM PC_REPO.REP_ALL_SOURCE_FLDS sf
WHERE 1=1
--AND sf.SUBJECT_AREA NOT LIKE 'WRK%' --omit working directories
AND sf.source_field_datatype = 'number(p,s)'
AND sf.SOURCE_FIELD_PRECISION IS NOT NULL
AND sf.SOURCE_FIELD_SCALE = 0
--AND sf.SOURCE_NAME not like 'Shortcut_to%' --omit shortcut references
--AND upper(sf.SOURCE_DATABASE_NAME) <> 'BADDATABASE' --omit specific source
order by 2,3,1,4