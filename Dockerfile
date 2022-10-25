FROM postgres:14.4

LABEL maintainer="dedy.styawan@gmail.com"

ENV PG_MAJOR 14
ENV PG_FULL 14.4

# Install the postgresql debugger
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  postgresql-$PG_MAJOR-pldebugger

EXPOSE 5432