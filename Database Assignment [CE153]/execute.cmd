@echo off

rem If you want the "interactive output" format in batch mode, use mysql -t
rem To echo to the output the commands that are executed, use mysql -vvv
rem for example:
rem mysql -t -vvv -u root < database_install.sql > database_install_log.txt
rem mysql -t -vvv -u root < query.sql > query_log.txt

mysql -vvv -u root < database_install.sql > database_install_log.txt
mysql -vvv -u root < query.sql > query_log.txt

pause
