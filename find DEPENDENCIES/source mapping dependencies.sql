/*
	Return all mappings that use a specific source
	Integrate with dynamic SQL or use for one-off investigation

	Accurate as of Informatica Powercenter 9.6

*/
SELECT SUBJECT_AREA,SOURCE_NAME,MAPPING_NAME 

FROM PC_REPO.REP_SRC_MAPPING
--set source here
where source_name = 'YOURTABLENAMEHERE' /*name of table*/

ORDER BY 1,2,3