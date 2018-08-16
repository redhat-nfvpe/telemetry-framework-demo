body=$(cat  << EOF
	{
          "name": "prometheus_test",
	  "type": "prometheus",
	  "typeLogoUrl": "public/app/plugins/datasource/prometheus/img/prometheus_logo.svg",
	  "access": "proxy",
	  "url": "http://10.19.110.5:9090",
	  "password": "",
	  "user": "",
	  "database": "",
	  "basicAuth": false,
	  "isDefault": false,
	  "jsonData": {
	    "keepCookies": [],
	    "timeInterval": "5s"
	     },
          "readOnly": false
	}
EOF
)

curl -X POST -H 'Content-Type: application/json'\
 -H 'Authorization: Bearer eyJrIjoiNUp3NGxNMWZGOWJFZnU4d3NxR0ZHN1BsR3hQa2xySWUiLCJuIjoic2FfYXBpa2V5IiwiaWQiOjF9'\
 -H 'Accept: application/json'\
 -d "$body"  http://10.19.110.5:3000/api/datasources 

