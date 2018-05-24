alter table Schema.TableName add partition NAME20171218
values less than
(to_date('20171218 23:59:59','yyyymmdd hh24:mi:ss'))
pctfree 1 pctused 99
tablespace TableSpaceName ;
