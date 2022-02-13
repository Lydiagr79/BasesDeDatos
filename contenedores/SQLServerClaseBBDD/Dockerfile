#FROM microsoft/mssql-server-linux
FROM mcr.microsoft.com/mssql/server
COPY ./data/ ./var/opt/mssql/backup/
COPY ./entrypoint.sh .
COPY ./CargarDatos.sql .
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=12345Ab##
CMD /bin/bash ./entrypoint.sh

