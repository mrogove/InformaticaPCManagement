/*
	This query was used in a standardization project.
	We needed to find all instances where keys were altered but not dropped in specific widgets.

	Informatica PC 9.6.1
*/

SELECT DISTINCT 
	CASE WHEN INSTR(tas.attr_value,';') <> 1 THEN tas.attr_value
    ELSE  tas.attr_value || ';' END
FROM PC_REPO.OPB_SWIDGET_ATTR TAS
	, PC_REPO.OPB_SUBJECT FLD
--, PC_REPO.OPB_TASK NAM
WHERE upper(trim(TAS.ATTR_VALUE)) LIKE 'ALTER%'
and  upper(trim(TAS.ATTR_VALUE)) not LIKE '%DROP%'
ORDER BY 1