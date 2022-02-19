# Download influxdb and telegraf images
docker pull influxdb:latest
docker pull telegraf:latest

# Initialize the swarm
docker swarm init

# (re)create data directory for influxdb
rm -rf influxdb-data/ && mkdir -p influxdb-data/

# Start InfluxDB database (issue `docker stack rm influxdb` command to just kill it
# to be able to restart it with previous data and boards)
docker stack deploy -c docker-compose-influxdb.yml influxdb

# Open InfluxDB Web UI, create a read/write token for FCC bucket
# and copy it in "token" parameter of telegraf.toml

# Start telegraf agent (issue `docker stack rm telegraf` command to just kill it
# to be able to restart it with previous data and boards)
docker stack deploy -c docker-compose-telegraf.yml telegraf
