#!/bin/sh
## startup wrapper script

CONFIG_FILE='/etc/ckan-proxy.json'

cat ${CONFIG_FILE} |\
    jq '.whitelist.ckan.url = "'${EDP_DATA_API_URL}'"' |\
    jq '.whitelist.ckan.updateInterval = '${WHITELIST_UPDATE_INTERVAL_MINUTES} |\
    jq '.whitelist.storageDir = "'${WHITELIST_STORAGE_DIR}'"' |\
    jq '.logging.level = "'${LOGGING_LEVEL}'"' >> ${CONFIG_FILE}.tmp && mv ${CONFIG_FILE}.tmp ${CONFIG_FILE}

ckan-proxy /etc/ckan-proxy.json
