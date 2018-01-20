/*
	Use this query to determine whether "lookup" widgets are being referenced, and where.

     Important as these widgets can introduce custom SQ transformations that otherwise fall out of monitoring/administrative sweeps.

     Used in standardization project to move away from lookups where possible and ensure no duplicate transformations.
*/
     SELECT m.MAPPING_NAME
     , i.WIDGET_TYPE_NAME
     , i.INSTANCE_NAME
     , i.*
     , m.* 
     FROM PC_REPO.REP_WIDGET_INST i
     , PC_REPO.REP_ALL_MAPPINGS m
WHERE m.MAPPING_ID = i.MAPPING_ID
     AND i.WIDGET_TYPE = 11
     AND i.INSTANCE_NAME LIKE '%EMPLOYEE%'