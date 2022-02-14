FROM mcr.microsoft.com/mssql/server
COPY ./nba.csv .
COPY ./players.csv .
COPY ./randomperson.csv .
COPY ./entrypoint.sh .
COPY ./nba.sql .
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=12345Ab##
CMD /bin/bash ./entrypoint.sh

