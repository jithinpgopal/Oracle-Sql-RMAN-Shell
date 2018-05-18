alter session set optimizer_mode=RULE;
set pages 1200
set line 300
col STATUS for a10
col Duration_In_Min for 999.99
col INPUT_GB for 99999.99
col OUTPUT_GB for 99999.99
Col AVG_BKP_speed_in_MB_PER_MIN for 999999.99
col ARCH_SIZE_GB for 9999.99
col START_TIME for a20
col END_TIME for a20
col STATUS for a25
break on OBJECT_TYPE

-----------------Backup Information 
select OBJECT_TYPE,STATUS,
to_char(START_TIME,'DD-MON-YYYY HH24:MI') start_Time,
to_char(END_TIME,'DD-MON-YYYY HH24:MI') END_TIME,
round((END_TIME-start_Time)*24*60,2) Duration_In_Min,
round(INPUT_BYTES/1024/1024/1024,2) INPUT_GB,
round(OUTPUT_BYTES/1024/1024/1024,2) OUTPUT_GB,
round((OUTPUT_BYTES/1024/1024)/((END_TIME-start_Time)*24*60),2) AVG_BKP_speed_in_MB_PER_MIN
from V$RMAN_STATUS v
where sysdate-START_TIME<=30
  and INPUT_BYTES>0
  and OPERATION='BACKUP'
order by OBJECT_TYPE,v.start_time;
