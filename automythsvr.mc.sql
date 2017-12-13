CREATE DATABASE IF NOT EXISTS mythconverg;
GRANT ALL ON mythconverg.* TO mythtv@localhost IDENTIFIED BY "mythtv";
GRANT ALL ON mythconverg.* TO mythtv@"automythsvr-g36fe0ce" IDENTIFIED BY "mythtv";
FLUSH PRIVILEGES;
GRANT CREATE TEMPORARY TABLES ON mythconverg.* TO mythtv@localhost IDENTIFIED BY "mythtv";
GRANT CREATE TEMPORARY TABLES ON mythconverg.* TO mythtv@"automythsvr-g36fe0ce" IDENTIFIED BY "mythtv";
FLUSH PRIVILEGES;
ALTER DATABASE mythconverg DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
