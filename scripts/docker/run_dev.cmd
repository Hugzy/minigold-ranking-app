echo "staring databse"
docker volume create pgmount
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e PGDATA=/var/lib/postgresql/data/pgdata -v pgmount:/var/lib/postgresql/data postgres