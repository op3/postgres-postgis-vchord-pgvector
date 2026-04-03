ARG BASE=18-3.6

FROM docker.io/postgis/postgis:${BASE}

ARG VCHORD
ARG PGVECTOR
ARG BASE

LABEL maintainer="op3" \
      org.opencontainers.image.title="postgres-postgis-vchord-pgvector" \
      org.opencontainers.image.description="PostgreSQL with PostGIS, VectorChord, and pgvector extensions" \
      org.opencontainers.image.source="https://github.com/op3/postgres-postgis-vchord-pgvector" \
      org.opencontainers.image.version="${BASE}-${VCHORD}-${PGVECTOR}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates && \
    wget https://github.com/tensorchord/VectorChord/releases/download/${VCHORD}/postgresql-${PG_MAJOR}-vchord_${VCHORD}-1_$(dpkg --print-architecture).deb -P /tmp && \
    apt-get install -y postgresql-${PG_MAJOR}-pgvector=${PGVECTOR}-* && \
    apt-get install -y /tmp/postgresql-${PG_MAJOR}-vchord_${VCHORD}-1_$(dpkg --print-architecture).deb && \
    apt-get remove -y wget ca-certificates && \
    apt-get purge -y --auto-remove && \
    rm -rf /tmp/* /var/lib/apt/lists/*

CMD ["postgres", "-c", "shared_preload_libraries=vchord,vector"]
