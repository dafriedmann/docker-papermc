#!/bin/sh

# link configs
ln -sfn /minecraft/conf/* /minecraft/data
# link plugins
ln -sfn /minecraft/plugins /minecraft/data/plugins

# EULA
cd /minecraft/data
echo "eula=$EULA" >> eula.txt

# spin up server
java -jar -Xmx$MAX_MEMORY -Xms$MIN_MEMORY -jar /minecraft/paper.jar nogui