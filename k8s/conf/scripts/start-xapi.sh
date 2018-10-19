#!/bin/sh
sed -i -e "s#MONGO_URL=mongodb://localhost:27017/learninglocker_v2#MONGO_URL=$MONGODB_PATH#g" /src/.env
sed -i -e "s#REDIS_PREFIX=LEARNINGLOCKER#REDIS_PREFIX=$SITE_BRANCH#g" /src/.env
cd /src
/usr/local/bin/node dist/server.js