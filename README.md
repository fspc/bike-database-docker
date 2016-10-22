##Bike Database##

**BikeBike Docker Container Image for Bike Database**

The [Bikes and Clients database](https://github.com/Loos/bike-database) is used by [Recyclery](http://therecyclery.org/) staff and volunteers to track bikes and by our partner organizations to request a free bike for their clients.

##Pull the repository

```
docker pull bikebike/bike-database
```


##Run the docker container

Publish the container's port to the host:

>format: ip:hostPort:containerPort | ip::containerPort | hostPort:containerPort


```
docker run -d -p 3000:3000 --name=bike-database" bikebike/bikedatabase
```

##Password

Password is *password* for **staff@freeridepgh.org** and **volunteer@freeridepgh.org**.


##How to test/develop inside the running container process 

This method uses [nsenter](http://jpetazzo.github.io/2014/06/23/docker-ssh-considered-evil/).  Check out [jpetazzo/nsenter](https://github.com/jpetazzo/nsenter) on GitHub. 

```
sudo PID=$(docker inspect --format {{.State.Pid}} <container_name_or_ID>)
sudo nsenter --target $PID --mount --uts --ipc --net --pid
