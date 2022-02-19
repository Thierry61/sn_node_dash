Setup for sn_node tests in Docker. There 4 stacks each with one service:
- docker-compose-influxdb.yml: InfluxDB database
- docker-compose-telegraf.yml: Telegraf agent
- docker-compose-genesis.yml: Genesis node
- docker-compose-nodes.yml: Other nodes (with replicas)
