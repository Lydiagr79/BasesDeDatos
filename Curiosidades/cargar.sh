#!/bin/bash
directorio=$2
for i in $(ls $directorio)
do
 docker exec -it $1 /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 12345Ab## -Q "RESTORE DATABASE ${i%%.*}  FROM DISK = N'/var/opt/mssql/$2/$i'"
done
