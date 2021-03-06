/*
	Misc. query for finding any expression port using SUBSTR.

	Can be extended for any inline SQL statements. Very useful.

	Part of standardization project; also a tool shared with developers.

	Informatica PC 9.6.1
*/

SELECT DISTINCT REP_ALL_MAPPINGS.SUBJECT_AREA
, REP_ALL_MAPPINGS.MAPPING_NAME
, REP_WIDGET_INST.WIDGET_TYPE_NAME AS TRANSFORMATION_TYPE
, REP_WIDGET_INST.INSTANCE_NAME AS TRANSFORMATION_NAME
, REP_WIDGET_FIELD.FIELD_NAME AS PORT_NAME,
CASE
  WHEN REP_WIDGET_FIELD.PORTTYPE = 1 THEN 'I'
  WHEN REP_WIDGET_FIELD.PORTTYPE = 2 THEN 'O'
  WHEN REP_WIDGET_FIELD.PORTTYPE = 3 THEN 'IO'
  WHEN REP_WIDGET_FIELD.PORTTYPE = 32 THEN 'V'
END AS PORT_TYPE,
REP_WIDGET_FIELD.EXPRESSION
FROM PC_REPO.REP_WIDGET_INST REP_WIDGET_INST
, PC_REPO.REP_WIDGET_FIELD REP_WIDGET_FIELD
, PC_REPO.REP_ALL_MAPPINGS REP_ALL_MAPPINGS
WHERE REP_WIDGET_INST.WIDGET_ID = REP_WIDGET_FIELD.WIDGET_ID
AND REP_WIDGET_INST.MAPPING_ID = REP_ALL_MAPPINGS.MAPPING_ID
AND REP_WIDGET_INST.WIDGET_TYPE = 5
AND UPPER(REP_WIDGET_FIELD.EXPRESSION) LIKE '%SUBSTR%'
ORDER BY 1
