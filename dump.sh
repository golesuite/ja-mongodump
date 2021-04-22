#!/bin/bash 

DUMP_DIR=/var/backup
mkdir $DUMP_DIR

variables_failed(){
	echo "Please check that the following variables are defined:"
	echo "  ME_CONFIG_MONGODB_ADMINUSERNAME"
	echo "  ME_CONFIG_MONGODB_ADMINPASSWORD"
	echo "  ME_CONFIG_MONGODB_SERVER"
	echo "  ME_CONFIG_MONGODB_PORT"
	echo "  SLEEP_TIME (default value: 10800 seconds)"
	exit 1
}

[[ -z ${ME_CONFIG_MONGODB_ADMINUSERNAME+x} ]] && variables_failed
[[ -z ${ME_CONFIG_MONGODB_ADMINPASSWORD+x} ]] && variables_failed
[[ -z ${ME_CONFIG_MONGODB_SERVER+x} ]] && variables_failed
[[ -z ${ME_CONFIG_MONGODB_PORT+x} ]] && variables_failed

[[ -z ${SLEEP_TIME+x} ]] && SLEEP_TIME="10800"

while :; do
	# mongodb dump full
	mongodump \
		--uri=mongodb://"$ME_CONFIG_MONGODB_ADMINUSERNAME":"$ME_CONFIG_MONGODB_ADMINPASSWORD"@"$ME_CONFIG_MONGODB_SERVER":"$ME_CONFIG_MONGODB_PORT" \
		-o "$DUMP_DIR"/dump_mmp5_$(date "+%Y-%m-%d")

	touch $DUMP_DIR/backup_ok.tmp

	sleep "$SLEEP_TIME"
done
