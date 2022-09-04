echo "Start preparing DB"
mysql -h mariadb -u harpia -pharpia --execute="CREATE DATABASE IF NOT EXISTS harpia;"
echo "DB was created"
mysql -h mariadb -u harpia -pharpia --execute="set global tx_isolation='read-committed';"
mysql -h mariadb -u harpia -pharpia --execute="CREATE USER IF NOT EXISTS 'harpia'@'%' IDENTIFIED BY 'harpia'; GRANT ALL PRIVILEGES ON *.* TO 'harpia'@'%';"
echo "Start importing DB"
mysql -h mariadb -u harpia -pharpia harpia < harp_db_template.sql
echo "Finish importing DB"