# InformaticaPCManagement

**Oracle**-style SQL syntax. Can be easily adapted to other syntaxes (MySQL, SQL Server, etc.).
References Informatica PowerCenter's on-premise metadata repository.
The schema is labeled as **PC_REPO** in this exercise.

These queries were developed and adapted to manage, orchestrate, and administer an enterprise Informatica Powercenter-based ETL.

## Main purposes for development of these queries:
* Standardization projects
  * Workflows and mappings were developed by distributed teams of developers in US and India; migration project owned by >1 architect. Communicating standards was key; I was responsible for enforcing and cleaning up where we failed. 
  * Find sore thumbs.
  * Data integrity sometimes depended on very specific typing in mappings; some widgets' update/insert configuration could impact display of end data.

* ETL Orchestration
  * Developed master workflow to run a resilient data-driven ETL that managed dependency chaining and scheduling.
  * Queries in this repository were adapted to be called in production via Informatica mappings/transformations to check dependencies, call subsequent workflows, etc.
  
 I have only included agnostic queries that strictly reference the metadata repository and not in-house ETL metadata tables specific to the business.
 
 
