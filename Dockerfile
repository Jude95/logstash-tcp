FROM logstash:7.4.1

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/

EXPOSE 4560

ENV ELASTICSEARCH_HOST="elasticsearch"