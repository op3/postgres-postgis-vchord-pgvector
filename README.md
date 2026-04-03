# postgres-postgis-vchord-pgvector

Container image combining PostgreSQL with PostGIS, VectorChord, and pgvector extensions.

## Image

```
ghcr.io/op3/postgres-postgis-vchord-pgvector:18-3.6
```

Tag format: `{pg_major}-{postgis_version}-{vchord_version}-{pgvector_version}`

Additional tags:
- `{pg_major}-{postgis_version}-{vchord_major.minor}-{pgvector_major.minor}`
- `{pg_major}-{postgis_version}`

## Included Extensions

| Extension | Description |
|-----------|-------------|
| [PostGIS](http://postgis.net/) | Spatial database extension for PostgreSQL |
| [VectorChord](https://github.com/tensorchord/VectorChord) | Scalable vector search with RaBitQ compression |
| [pgvector](https://github.com/pgvector/pgvector) | Vector similarity search for PostgreSQL |

## Usage

```bash
docker run \
  --name postgres-postgis-vchord \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d ghcr.io/op3/postgres-postgis-vchord-pgvector:18-3.6
```

Enable extensions:

```sql
CREATE EXTENSION postgis;
CREATE EXTENSION vector;
CREATE EXTENSION vchord;
```

## Version Matrix

| Tag | PostgreSQL | PostGIS | Debian |
|-----|------------|---------|--------|
| `18-3.6-*` | 18 | 3.6 | trixie |

VectorChord and pgvector versions are fetched at build time from their respective releases.

## Related Projects

- [docker-postgis](https://github.com/postgis/docker-postgis) - Base PostGIS image
- [VectorChord](https://github.com/tensorchord/VectorChord) - Vector search extension
- [pgvector](https://github.com/pgvector/pgvector) - Vector similarity search

## License

MIT License - see [LICENSE](LICENSE) for details.

The container image includes software under various licenses:
- PostgreSQL: PostgreSQL License
- PostGIS: GPL-2.0-or-later
- VectorChord: AGPL-3.0 or Elastic-2.0 (dual license)
- pgvector: PostgreSQL License
