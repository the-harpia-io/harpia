mysql -u harpia -pharpia --execute="CREATE DATABASE IF NOT EXISTS harpia;"
mysql -u harpia -pharpia --execute="set global tx_isolation='read-committed';"
mysql -u harpia -pharpia --execute="CREATE USER IF NOT EXISTS 'harpia'@'%' IDENTIFIED BY 'harpia'; GRANT ALL PRIVILEGES ON *.* TO 'harpia'@'%';"
mysql -u harpia -pharpia harpia < harp_db_template.sql