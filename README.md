ja-mongodbump
==============

While True looping to dump and send a mongo databases to google bucket.

Working with env variables.

This script is part a CI/CD DevOps pipeline.

| variables | default value | required | description |
|:---------:|:------------:|:---------:|:-----------:|
| ME_CONFIG_MONGODB_ADMINUSERNAME | | X |
| ME_CONFIG_MONGODB_ADMINPASSWORD | | X |
| ME_CONFIG_MONGODB_SERVER | | X |
| ME_CONFIG_MONGODB_PORT | | X |
| DUMP_DIR | | X | | Directory used 
| SLEEP_TIME | 10800 | | mongodump time, in seconds |
