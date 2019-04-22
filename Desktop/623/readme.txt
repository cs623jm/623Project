Followed link to installing mysql
https://dev.mysql.com/doc/mysql-getting-started/en/
create user root pw123456 

created tables author, paper, reviewer, review, topic, assigned
this is according to giraffe academy on sql video 23. translating er diagram to schemas.

used following mysql commands:
----------------------------------
to create a new db use ---> create database 623jm;   
to use new database-------> use 623jm;
creating tables with cmd--> create table 'name' (field1 varchar(1-infinity), field2 varchar(1-infinity), fieldn(1-infinity));
'' is not to be added into table creation, varchar or int with whatever size you want.
created foriegn key for --> ALTER TABLE t_name1 ADD FOREIGN KEY (column_name) REFERENCES t_name2(column_name)
making primary keys------->ALTER TABLE 'table name' ADD PRIMARY KEY ('field to be made the key');
inserting data into table-> insert into 'tablename' (field1 varchar(1-infinity), field2 varchar(1-infinity), fieldn(1-infinity), values
(data per field with "" enclosing the data then close with ')' end with ;

along the route added and deleted columns. added and deleted data. youtubed and googled for help.
