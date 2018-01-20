/*
	Lookups, as a widget, might fall out of other administrative queries. 
	They might contain custom SQ that reference things you care about!
*/
SELECT m.MAPPING_NAME, i.WIDGET_TYPE_NAME, i.INSTANCE_NAME, i.*,m.* 

FROM pc_repo.rep_widget_inst i
     , PC_REPO.REP_ALL_MAPPINGS m
WHERE m.MAPPING_ID = i.MAPPING_ID
     and i.WIDGET_TYPE = 11
     and upper(i.INSTANCE_NAME) like '%%'