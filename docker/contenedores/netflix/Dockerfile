FROM mcr.microsoft.com/mssql/server:2017-latest
COPY ./movies.csv .
COPY ./oscars.csv .
COPY ./randomperson.csv .
COPY ./entrypoint.sh .
COPY ./oscars.sql .
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=12345Ab##
CMD /bin/bash ./entrypoint.sh

