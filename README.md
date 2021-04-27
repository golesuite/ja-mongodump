ja-mongodbump
==============

1. Execute a complete dump mongodb
2. Send the dump output to a google bucket. Please see DUMP_DIR variable inside a dump.sh for more information about dump structure.


| variables | default value | required | description |
|:---------:|:------------:|:---------:|:-----------:|
| ME_CONFIG_MONGODB_ADMINUSERNAME | | X | Mongo Admin user |
| ME_CONFIG_MONGODB_ADMINPASSWORD | | X | Mongo Admin password |
| ME_CONFIG_MONGODB_SERVER | | X | Mongo server address (IP or hostname) |
| ME_CONFIG_MONGODB_PORT | | X | Mongo server port |
| GS_BUCKET | | X | google bucket (ex: `gs://backup-project/` ) |
| PROJECT_ID | | X | google project, used by `gcloud auth --project` |
| K8S_CLUSTER | | X | k8s cluster identification |
| K8S_NAMESPACE | | X | k8s namespaces identification |
