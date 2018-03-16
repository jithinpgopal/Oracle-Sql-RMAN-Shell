SET HEAD ON
SET VERIFY OFF
SET PAGES 1000
col tspace form a25 Heading "Tablespace"
col tot_ts_size form 99999999999999 Heading "Size (Mb)"
col free_ts_size form 99999999999999 Heading "Free (Mb)"
col ts_pct form 999 Heading "% Free"
col ts_pct1 form 999 Heading "% Used"
SELECT df.tablespace_name tspace,
       df.bytes/(1024*1024) tot_ts_size,
       sum(fs.bytes)/(1024*1024) free_ts_size,
       round(sum(fs.bytes)*100/df.bytes) ts_pct,
       round((df.bytes-sum(fs.bytes))*100/df.bytes) ts_pct1
FROM dba_free_space fs,
(select tablespace_name, sum(bytes) bytes
from dba_data_files group by tablespace_name ) df
WHERE fs.tablespace_name = df.tablespace_name
GROUP BY df.tablespace_name, df.bytes
order by ts_pct1;
