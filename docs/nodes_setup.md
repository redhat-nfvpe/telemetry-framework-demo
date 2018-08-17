# Node Monitoring Setup

The following details how to enable the collection of metrics and events using the Barometer and AMQP1 containers.  These containers were built specifically for use by the Service Assurance project. 

 - The Barometer container is located at: [nfvpe/barometer-collectd](https://hub.docker.com/r/nfvpe/barometer-collectd/) 
 - The QDR container is located at: [nfvpe/qpid-dispatch-router]
   - Tag 1.2.0-2 is the latest (not latest)
 (https://hub.docker.com/r/nfvpe/qpid-dispatch-router/)

1. Make sure Docker is installed
2. Make sure dockerd is running 
3. In your working directory create a directory for the collectd.conf file (i.e *./collectd_config_demo*)
4. Create a collectd.conf in the directory.  The contents should match the collectd.conf file in the **../configs** directory
5. Run the following command to start the collectd container
```
run -tid --net=host --pid=host -v ./collectd_config_demo:/opt/collectd/etc  -v var/run:/var/run -v /tmp:/tmp  --privileged nfvpe/barometer-collectd:latest
```
6. Create a directory for the *qdrouterd.conf* config file (i.e *./qdr.conf.d*)
7. Create the *qdrouterd.conf* file in the directory.  The contents should match the *qdrouterd.conf* file in *../configs*.
8. Run the following command to start the QDR container
```
run -d -v /root/qdr.conf.d/:/etc/qdr.conf.d/ -P --net=host  'nfvpe/qpid-dispatch-router:1.2.0-2' /sbin/qdrouterd --config=/etc/qdr.conf.d/qdrouterd.conf
```





