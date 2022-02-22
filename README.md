Setup for sn_node tests in Docker. There 4 stacks each with one service:
- docker-compose-influxdb.yml: InfluxDB database
- docker-compose-telegraf.yml: Telegraf agent
- docker-compose-genesis.yml: Genesis node
- docker-compose-nodes.yml: Other nodes (with replicas)

To relaunch Telegraf in stdout mode: `docker stack rm telegraf && docker stack deploy -c docker-compose-telegraf.yml telegraf && sleep 2 && docker ps -a` and then `docker logs <container_id>`