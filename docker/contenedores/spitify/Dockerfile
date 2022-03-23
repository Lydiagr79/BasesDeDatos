FROM mcr.microsoft.com/mssql/server:2017-latest
COPY ./data/*.csv .
COPY ./entrypoint.sh .
COPY ./spitify.sql .
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=12345Ab##
CMD /bin/bash ./entrypoint.sh

