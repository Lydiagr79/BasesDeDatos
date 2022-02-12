#FROM microsoft/mssql-server-linux
FROM mcr.microsoft.com/mssql/server
COPY ./entrypoint.sh .
COPY ./arepazo.sql .
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=12345Ab##
CMD /bin/bash ./entrypoint.sh

