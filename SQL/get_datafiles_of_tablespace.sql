select file_name,bytes/1024/1024/1024,autoextensible,MAXBYTES/1024/1024/1024 from dba_data_files where tablespace_name like 'USERS';
