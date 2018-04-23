FROM mongo:latest

MAINTAINER EasyMetrics

# Setup build environment
# ...
RUN apt-get update && apt-get install -y cron netcat-traditional netcat-openbsd

# Copy install & configuration scripts
# ...
COPY ./.docker/scripts /mongo_scripts

# Set execution permissions on scripts
# ...
RUN chmod +rx /mongo_scripts/*.sh

EXPOSE 27017

ENTRYPOINT ["/mongo_scripts/run.sh"]
