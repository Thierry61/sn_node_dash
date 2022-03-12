# Beware this file contains secrets
# Here there are not important because they allow to access a local InfluxDB OSS instance
# but do not push this file when it is modified to access an InfluxDB Cloud instance.

# Variables specific to telegraf.sh
export node_name="mynode"
export logs_path="$HOME/.safe/node/logs"

# Common variables for empty_bucket.sh and telegraf.sh
export bucket="SN"
export url="http://localhost:8086"
export token="GYQamYfyV46350EY0EBw7bVPUzVQGXz6qUEGkV3BFdchJJ0IPOn1xTpV-HkhJV3NaJ-Jb1MGi9w_Zk9gmcaL1w=="
export organization="MyOrg"
