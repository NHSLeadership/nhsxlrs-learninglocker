#!/bin/sh
sed -i -e "s#SITE_URL=http://127.0.0.1#SITE_URL=$SITE_URL#g" /src/.env
sed -i -e "s#APP_SECRET=#APP_SECRET=$APP_SECRET#g" /src/.env
sed -i -e "s#REDIS_PREFIX=LEARNINGLOCKER#REDIS_PREFIX=$SITE_BRANCH#g" /src/.env
sed -i -e "s#SMTP_PASS=password#SMTP_PASS=$SMTP_PASS#g" /src/.env
sed -i -e "s#QUEUE_NAMESPACE=DEV#QUEUE_NAMESPACE=$SITE_BRANCH#g" /src/.env
sed -i -e "s#NEW_RELIC_LICENSE_KEY=#NEW_RELIC_LICENSE_KEY=$NEWRELIC_LICENSE_KEY#g" /src/.env
sed -i -e "s#NEWRELIC_API_NAME=#NEWRELIC_API_NAME=$SITE_NAME-$SITE_BRANCH-$ENVIRONMENT-API#g" /src/.env
sed -i -e "s#NEWRELIC_UI_NAME=#NEWRELIC_API_NAME=$SITE_NAME-$SITE_BRANCH-$ENVIRONMENT-UI#g" /src/.env
sed -i -e "s#MONGODB_PATH=mongodb://localhost:27017/learninglocker_v2#MONGODB_PATH=$MONGODB_PATH#g" /src/.env
exec /usr/bin/supervisord -n -c /etc/supervisor.conf
cd /src && pm2 start pm2/all.json --no-daemon