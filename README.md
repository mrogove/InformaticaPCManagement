# Informatica PowerCenter Metadata Management.
> _go spelunking in your IPC's blackbox!_

These queries were developed and adapted to manage, orchestrate, and administer an enterprise Informatica Powercenter-based ETL.

## Main purposes for development of these queries:
* Standardization projects
  * Workflows and mappings were developed by distributed teams of developers in US and India; migration project owned by >1 architect. Communicating standards was key; I was responsible for enforcing and cleaning up where we failed. 
  * Find sore thumbs.
  * Data integrity sometimes depended on very specific typing in mappings; some widgets' update/insert configuration could impact display of end data.

* ETL Orchestration
  * Developed master workflow to run a resilient data-driven ETL that managed dependency chaining and scheduling.
  * Queries in this repository were adapted to be called in production via Informatica mappings/transformations to check dependencies, call subsequent workflows, etc.

*******
| Section       | General purpose      |
| ------------- | ------------- |
| FIND DEPENDENCIES | Locate any references to a given string (say, database table) in entire ETL repository. |
| FIND SOURCES| For handling Informatica Sources; especially useful when investigating typing of columns. DEPENDENCIES more exhaustive for chasing down all references to a given "SOURCE" table, however. |
| FIND TARGETS | Similar to FIND SOURCES; also includes DB Connections type query. |
| FIND TIMING AND STATS | How long are things running? Which workflows succeeded? The bones of the ETL orchestration tool I built. Can also be super useful for debugging ETL runs. |
| FIND COMMON OBJECTS | What if I've got a source used in multiple parts of the ETL? By different business units? In the enterprise ETL that necessitated these queries, those objects were treated differently. This is an example of a query not agnostic to the ETL implementation. Finding sources referenced in multiple folders is still useful, so it lives here. |
| FIND HARDCODED REFERENCES | Simple adaptation used elsewhere - used to flush out specific references to years in filters (cheaters!), for example |
| FIND OBJECT, KEY CHARACTERSTICS | The swiss army knife. Most granularity. This borrowed heavily from outside experts and Informatica forums to determine widget attribute IDs that corresponded to the correct Informatica modules. |

*******
**Oracle**-style SQL syntax. Can be easily adapted to other syntaxes (MySQL, SQL Server, etc.). Note that CTE, SUBSTR, and ordering syntax will be likely snags.

References Informatica PowerCenter's on-premise metadata repository.

The schema is labeled as **PC_REPO** in this exercise.

With few exceptions, I have only included agnostic queries that strictly reference the metadata repository and not in-house ETL metadata tables. Nothing specific to the business has been included.

*******

 
