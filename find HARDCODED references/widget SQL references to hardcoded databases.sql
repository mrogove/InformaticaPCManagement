/*
	Determine whether widgets contain references to hardcoded arbitrary text, e.g. "DATABASENAME"
		Particularly useful for reading custom SQL added to transformations of mappings.
		Accurate as of Informatica 9.6

	Plug in to dynamic SQL, workflows, code, or for use in one-off research.
*/

SELECT DISTINCT 
	  REP_ALL_MAPPINGS.SUBJECT_AREA
	, REP_ALL_MAPPINGS.MAPPING_NAME
	, REP_WIDGET_ATTR.ATTR_NAME
	, REP_WIDGET_ATTR.ATTR_VALUE
FROM PC_REPO.REP_WIDGET_ATTR
	, PC_REPO.REP_WIDGET_INST
	, PC_REPO.REP_ALL_MAPPINGS
WHERE REP_WIDGET_ATTR.WIDGET_ID = REP_WIDGET_INST.WIDGET_ID
AND REP_WIDGET_INST.MAPPING_ID = REP_ALL_MAPPINGS.MAPPING_ID
AND REP_WIDGET_ATTR.WIDGET_TYPE IN (3,11,4)
AND (upper(REP_WIDGET_ATTR.ATTR_VALUE) LIKE '%' || 'DATABASENAME' || '%'
OR	 upper(REP_WIDGET_ATTR.ATTR_VALUE) LIKE '%' || 'LINKEDSERVERNAME' || '%'
)
ORDER BY 1,2,3;