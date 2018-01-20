/*
	My most used non-Informatica-specific query, though could be used against PC_REPO if needed.

	Return keys/constraints present in system.
	Crucial in orchestration of ETL, especially in consideration of dropping/adding keys for BULK insert procedures.
*/

SELECT cols.table_name
	 , cols.column_name
	 , cols.position
	 , cons.status
	 , cons.owner
	 , CONS.*
FROM ALL_CONSTRAINTS cons, all_cons_columns cols
WHERE cols.table_name = 'TABLE_NAME'
--AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
ORDER BY cols.table_name, cols.position;