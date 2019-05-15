#!/bin/sh

set -e

if [ "${DEBUG_MODE}" = 1 ]
then
  cat /tmp/jvm.options >> $CONFIG/jvm.options
fi

rm -rf /tmp/jvm.options

# Snipped from https://github.com/AdamBien/docklands/blob/master/openliberty-kernel/docker-server
keystorePath="${CUSTOM_CONFIG}/keystore.xml"

if [ ! -e $keystorePath ]
then
  # Generate the keystore.xml
  PASSWORD=$(openssl rand -base64 32)
  XML="<server description=\"Default Server\"><keyStore id=\"defaultKeyStore\" password=\"$PASSWORD\" /></server>"

  # Create the keystore.xml file and place in configDropins
  mkdir -p $(dirname $keystorePath)
  echo $XML > $keystorePath
fi

${WLP_HOME}/bin/server run defaultServer

