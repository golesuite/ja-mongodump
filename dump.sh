#!/bin/bash 

export PATH="$PATH:/opt/google-cloud-sdk/bin"

variables_failed(){
	echo "Please check that the following variables are defined:"
	echo "  ME_CONFIG_MONGODB_ADMINUSERNAME"
	echo "  ME_CONFIG_MONGODB_ADMINPASSWORD"
	echo "  ME_CONFIG_MONGODB_SERVER"
	echo "  ME_CONFIG_MONGODB_PORT"
	echo "  GS_BUCKET"
	echo "  PROJECT_ID"
	echo "  K8S_CLUSTER"
	echo "  K8S_NAMESPACE"
	exit 1
}

DUMP_DIR=/var/backups/"$K8S_CLUSTER"/"$K8S_NAMESPACE"/$(date "+%Y-%m-%d")/
mkdir -p "$DUMP_DIR"

[[ -z ${ME_CONFIG_MONGODB_ADMINUSERNAME+x} ]] && variables_failed
[[ -z ${ME_CONFIG_MONGODB_ADMINPASSWORD+x} ]] && variables_failed
[[ -z ${ME_CONFIG_MONGODB_SERVER+x} ]] && variables_failed
[[ -z ${ME_CONFIG_MONGODB_PORT+x} ]] && variables_failed

# mongodb dump full
mongodump \
	--uri=mongodb://"$ME_CONFIG_MONGODB_ADMINUSERNAME":"$ME_CONFIG_MONGODB_ADMINPASSWORD"@"$ME_CONFIG_MONGODB_SERVER":"$ME_CONFIG_MONGODB_PORT" \
	-o "$DUMP_DIR"

# upload mongodump to google bucket
gcloud auth activate-service-account --project-id=$PROJECT_ID --key-file=/etc/gcloud/key.json
gsutil rsync -r /var/backups/ "$GS_BUCKET"
