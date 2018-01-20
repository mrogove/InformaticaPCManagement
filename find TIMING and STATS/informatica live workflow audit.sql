/*
  control table vs work folders:
    --compares Informatica folders against what’s in data control table. This is a FULL OUTER JOIN.

  For use in auditing ETL as part of development lifecycle.

  You can use this to compare what is live in a given folder as compared with some arbitrary list (here CTE "b")
*/

with
a as
  (select distinct infa.task_name, c.subj_name FROM PC_REPO.OPB_TASK infa, PC_REPO.OPB_SUBJECT c where infa.subject_id = c.subj_id),
b as
  (select distinct etl.infamap_bulk_workflow_name from YOUR_INFORMATICA_CONTROL_TABLE etl) --ideally this table is source controlled and lists the production workflows.
  
select a.task_name as pcREPO
   , a.subj_name as locFolder
   , b.infamap_bulk_workflow_name as controlTable 
from a 
  full outer join b 
    on a.task_name = b.infamap_bulk_workflow_name
where a.TASK_NAME like 'NAMINGCONVENTIONHERE%'
  order by 3 desc, 1;

