/*
	Table dependency--
		see what mappings use a given table as source, target, lookup, SQ--anywhere!
		Accurate as of Informatica 9.6

	Plug in to dynamic SQL, workflows, code, or for use in one-off research.
	This particular query is useful for chaining dependencies in mappings when orchestrating the ETL.
*/

SELECT PARENT_SUBJECT_AREA FOLDER
	 , PARENT_MAPPING_NAME MAPPING

FROM PC_REPO.REP_ALL_MAPPINGS
WHERE MAPPING_ID IN (

	SELECT MAPPING_ID FROM PC_REPO.REP_WIDGET_INST
	WHERE WIDGET_ID IN (

		SELECT WIDGET_ID FROM PC_REPO.REP_WIDGET_ATTR

		WHERE (WIDGET_TYPE = 11 OR WIDGET_TYPE = 1 OR WIDGET_TYPE = 2 OR WIDGET_TYPE = 3 or WIDGET_TYPE = 4) 
		  AND (ATTR_ID = 2 OR ATTR_ID = 31 OR ATTR_ID = 19 OR ATTR_ID = 1)
		  AND upper(ATTR_VALUE) like '%YOURNAMEHERE%' /*table name of interset*/
		  AND WIDGET_ID IN (
				SELECT WIDGET_ID 
					FROM PC_REPO.REP_ALL_TRANSFORMS
					--WHERE PARENT_SUBJECT_AREA = ''
					)))