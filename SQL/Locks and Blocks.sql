select 
S.SQL_ID, s.status, round(s.last_call_et/60,2) "MIN",l1.sid, s.sid BLOCKER,S.SERIAL#, ' IS BLOCKING ', l2.sid BLOCKEE, S.MODULE
from 
v$lock l1, v$lock l2, v$session s 
where 
l1.block =1 and l2.request > 0 
and l1.id1=l2.id1 
and l1.id2=l2.id2 
and L1.SID = S.SID 
--and s.last_call_et > 1800 
order by MIN desc;




select s1.username || '@' || s1.machine 
 || ' ( SID=' || s1.sid || ' )  is blocking ' 
 || s2.username || '@' || s2.machine || ' ( SID=' || s2.sid || ' ) ' AS blocking_status 
 from v$lock l1, v$session s1, v$lock l2, v$session s2 
 where s1.sid=l1.sid and s2.sid=l2.sid 
 and l1.BLOCK=1 and l2.request > 0 
 and l1.id1 = l2.id1 
 and l2.id2 = l2.id2 ;

select * from v$lock






select 
S.SQL_ID, s.status, round(s.last_call_et/60,2) "MIN",l1.sid, s.sid BLOCKER,S.SERIAL#, ' IS BLOCKING ', l2.sid BLOCKEE, S.MODULE
from 
v$lock l1, v$lock l2, v$session s 
where 
l1.block =1 and l2.request > 0 
and l1.id1=l2.id1 
and l1.id2=l2.id2 
and L1.SID = S.SID 
--and s.last_call_et > 1800 
order by MIN desc;

SQL_ID        STATUS          MIN        SID    BLOCKER    SERIAL# 'ISBLOCKING'
------------- -------- ---------- ---------- ---------- ---------- -------------
   BLOCKEE MODULE
---------- ------------------------------------------------
              INACTIVE       1.13       1109       1109      41725  IS BLOCKING
      3406 PkShipWaveS@gaalplpapp034f (TNS V1-V3)


SYS @ pgws01 SQL>select OSUSER, USERNAME, SQL_ID FROM v$session where sid =1109;

OSUSER                         USERNAME                       SQL_ID
------------------------------ ------------------------------ -------------
wmosadmin                      WH_GWS1




SYS @ pgws01 SQL>desc v$lock  
 Name                                                                                                                                                                          Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 ADDR                                                                                                                                                                                   RAW(8)
 KADDR                                                                                                                                                                                  RAW(8)
 SID                                                                                                                                                                                    NUMBER

 
 
 SQL>select * from v$lock


ADDR             KADDR                   SID TY        ID1        ID2      LMODE    REQUEST      CTIME      BLOCK
---------------- ---------------- ---------- -- ---------- ---------- ---------- ---------- ---------- ----------
0000000CB0DDFD70 0000000CB0DDFDA8        757 TX    5111815    2560994          6          0         35          0
0000000CAC310D58 0000000CAC310D80        757 TM      19532          0          3          0         35          0
0000000CAE549EC0 0000000CAE549EF8       3003 TX    2228266    3605305          6          0         35          0
0000000CAC311B70 0000000CAC311B98       3003 TM      18991          0          3          0         35          0


SELECT O.OBJECT_NAME, S.SID, S.SERIAL#, P.SPID, S.PROGRAM,S.USERNAME,
S.MACHINE,S.PORT , S.LOGON_TIME,SQ.SQL_FULLTEXT 
FROM V$LOCKED_OBJECT L, DBA_OBJECTS O, V$SESSION S, 
V$PROCESS P, V$SQL SQ 
WHERE L.OBJECT_ID = O.OBJECT_ID 
AND L.SESSION_ID = S.SID AND S.PADDR = P.ADDR 
AND S.SQL_ADDRESS = SQ.ADDRESS;


OBJECT_NAME                                                                                                                             SID    SERIAL# SPID                     PROGRAM              USERNAME                                                                                                                          MACHINE                                                            PORT LOGON_TIME   SQL_FULLTEXT
-------------------------------------------------------------------------------------------------------------------------------- ---------- ---------- ------------------------ ------------------------------------------------ -------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------- ---------- ------------------- --------------------------------------------------------------------------------
DRIVERSUMMARY_EXPANDED                                                                                                                  168      38282 28890                    SQL Developer        TPDP164                                                                                                                   WKSP0006D87E                                                          63410 2018-09-23.02.28.24 UPDATE DRIVERSUMMARY_EXPANDED SET DELPKGS_OTHER = (SELECT COUNT(*) DELPKGS_OTHER




select object_type from dba_objects where object_name like 'DRIVERSUMMARY_EXPANDED';

select serial#,sid from v$session where sid = 168; 
   SERIAL#        SID 
---------- ---------- 
      5730          3 

To kill a session:

SQL> alter system kill session '168,38282'; 

38282        168

select * from V$LOCKED_OBJECT;



