ja-mongodbump
==============

While True looping to dump and send a mongo databases to google bucket.

Working with env variables.

This script is part a CI/CD DevOps pipeline.

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
