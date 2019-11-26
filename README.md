# Logstash-tcp-es
A Logstash image with a simple conf

```
input {
	tcp {
		port => 4560
		codec => "json"
	}
}

filter {
	date {
		match => [ "timestamp", "dd/MMM/YYYY:HH:mm:ss" ]
	}
}

output {
	elasticsearch {
		hosts => "${ELASTICSEARCH_HOST}"
		index => "logstash-%{+YYYY.MM.dd}"
	}
}
```


# Usage
```
docker run -d -p 4560:4560 -e ELASTICSEARCH_HOST="xx.xx.xx.xx:8080" -e ELASTICSEARCH_PROTOCOL="http" jude95/logstash-tcp-es
```