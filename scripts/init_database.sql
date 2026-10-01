/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted.Ensure having proper backups .

Note : In postgres sql , if any connection is present with the targeted Database  one cannot drop it , you have to be connected with some other 
database in order to drop the targeted database.
*/

-- Terminate any active connections to the target database so it can be dropped.
select pg_terminate_backend(pid)
from pg_stat_activity
where datname = 'DataWarehouse' and pid <>pg_backend_pid();

-- Drop the database if it already exists
DROP DATABASE IF EXISTS your_database_name;

-- Create database DataWarehouse  
create database DataWarehouse ;

-- create schemas
create schema bronze ;
create schema silver ;
create schema gold ;
