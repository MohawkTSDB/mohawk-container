FROM fedora

# make sqlite base directory
RUN mkdir /root/server
RUN mkdir /root/ssh
RUN mkdir /root/mohawk-webui

# install bin files
COPY ./mohawk/mohawk /usr/bin/
COPY ./mohawk-webui /root/mohawk-webui

# set env variables
ENV HAWKULAR_FILE_PEM="/root/ssh/server.pem" \
  HAWKULAR_FILE_KEY="/root/ssh/server.key" \
  HAWKULAR_PORT=8443 \
  HAWKULAR_DB_DIR=./server \
  HAWKULAR_DB_URL=127.0.0.1 \
  HAWKULAR_FLAGS="--tls --gzip" \
  HAWKULAR_STORAGE=memory \
  HAWKULAR_WEBUI="/root/mohawk-webui"

# declare volume
VOLUME /root/ssh
VOLUME /root/mohawk-webui

# tell the port number the container should expose
EXPOSE $HAWKULAR_PORT

# run the application
WORKDIR /root
RUN chmod -R ugo+rwx /root/server
CMD /usr/bin/mohawk $HAWKULAR_FLAGS \
  --port $HAWKULAR_PORT \
  --cert $HAWKULAR_FILE_PEM \
  --key $HAWKULAR_FILE_KEY \
  --storage $HAWKULAR_STORAGE \
  --media $HAWKULAR_WEBUI \
  --options "db-dirname=${HAWKULAR_DB_DIR}&db-url=${HAWKULAR_DB_URL}"
