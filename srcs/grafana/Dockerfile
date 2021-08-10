FROM alpine

RUN apk update && apk upgrade
RUN apk add grafana --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/

COPY 	grafana.ini /usr/share/grafana/conf/custom.ini

COPY 	influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY 	dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY 	/dashboards/* /var/lib/grafana/dashboards/

EXPOSE 3000
ENTRYPOINT [ "grafana-server", "--homepath=/usr/share/grafana" ]