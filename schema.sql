-- CREATING DATABASE
CREATE PLUGGABLE DATABASE mon_peacock_leagueManagementSystem
ADMIN USER mon_peacock IDENTIFIED BY peacock
FILE_NAME_CONVERT = ('E:\oracle\oradata\ORCL\pdbseed', 'E:\plsql\pdbs\peacock');


GRANT DBA TO mon_peacock;