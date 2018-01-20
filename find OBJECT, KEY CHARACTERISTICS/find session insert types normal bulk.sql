/*
     List all sessions with load types
     
     Developed as part of standardization project. 

     BULK and NORMAL loading used for very different purposes in ETL - performance and concurrency considerations.
     
     Partially adopted from forums to determine ATTR_ID for sessions (it's 3)

*/

     SELECT DISTINCT
           REP_LOAD_SESSIONS.SUBJECT_AREA AS FOLDER
          , REP_LOAD_SESSIONS.SESSION_NAME
          --, REP_SESS_WIDGET_CNXS.CNX_NAME AS CONNECTION_NAME
          , CASE WHEN OPB_EXTN_ATTR.ATTR_VALUE ='0' THEN 'NORMAL'
                    WHEN OPB_EXTN_ATTR.ATTR_VALUE ='1' THEN 'BULK'
               END AS TARGET_LOAD_TYPE
          , 'BULK'
     FROM
          PC_REPO.REP_LOAD_SESSIONS
          , PC_REPO.REP_SESS_WIDGET_CNXS
          , PC_REPO.OPB_EXTN_ATTR
     WHERE REP_LOAD_SESSIONS.SESSION_ID=REP_SESS_WIDGET_CNXS.SESSION_ID
          AND REP_LOAD_SESSIONS.SESSION_ID=OPB_EXTN_ATTR.SESSION_ID
          AND OPB_EXTN_ATTR.ATTR_ID=3 --sessions, specifically.
          AND OPB_EXTN_ATTR.ATTR_VALUE ='0' --gives us live sessions
          --and REP_LOAD_SESSIONS.SUBJECT_AREA NOT LIKE 'WRK_%' --omit working directory

