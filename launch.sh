# Download images
docker pull influxdb:latest
docker pull telegraf:latest
docker pull grafana/grafana-oss

# Initialize the swarm
docker swarm init

# (re)create data directory for influxdb
rm -rf influxdb-data/ && mkdir -p influxdb-data/

# Same for grafana but it needs privileges on directory
rm -rf grafana-data/ && mkdir grafana-data/
sudo chmod -R 777 grafana-data/

# Start InfluxDB database (issue `docker stack rm influxdb` command to just kill it
# to be able to restart it with previous data and boards)
docker stack deploy -c docker-compose-influxdb.yml influxdb

# Open InfluxDB Web UI, create a read/write token for SN bucket
# and copy it in "token" env var of docker-compose-telegraf.yml

# Start telegraf agent
docker stack deploy -c docker-compose-telegraf.yml telegraf

# Start Grafana container (issue `docker stack rm grafana` command to just kill it
# to be able to restart it with previous boards)
docker stack deploy -c docker-compose-grafana.yml grafana

# Configure Grafana exposed by http://localhost:3000
# - Create an InfluxDB data source named "InfluxDB Cloud" (even though it is local) with type Flux, no auth selected, URL=http://influxdb:8086, Bucket=SN and appropriate Organization and Token
# - Import dashboard (click big +, select import, upload JSON file, browse to exported file and select data source created above and click import)
#   Note that the dashboard must have been exported with "Export for sharing externally" flag)
