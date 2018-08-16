body=$(cat  << EOF
	{
	"name": "Connectivity",
	"type": "elasticsearch",
	"typeLogoUrl": "public/app/plugins/datasource/elasticsearch/img/elasticsearch.svg",
	"access": "proxy",
	"url": "http://10.19.110.5:9200",
	"password": "",
	"user": "",
	"database": "collectd_connectivity",
	"basicAuth": false,
	"isDefault": false,
	"jsonData": {
		"esVersion": 5,
		"timeField": "startsAt",
		"timeInterval": "60s"
	},
	"readOnly": false
	}
EOF
)

curl -X POST -H 'Content-Type: application/json'\
 -H 'Authorization: Bearer eyJrIjoiNUp3NGxNMWZGOWJFZnU4d3NxR0ZHN1BsR3hQa2xySWUiLCJuIjoic2FfYXBpa2V5IiwiaWQiOjF9'\
 -H 'Accept: application/json'\
 -d "$body"  http://10.19.110.5:3000/api/datasources 

