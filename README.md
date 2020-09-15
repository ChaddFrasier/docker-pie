# docker-pie
Docker Image for installing and running the server.


### PIE
A planetary image editor built for the USGS researchers with the goal of simplifying the research publication process.

// TODO: 
    - link to PIE github
    - instructions on how to update docker container
    - point users to github link for 'contrubuting' to PIE
    
### Install


For The Normmal builds will require a data download. 
    - these containers are for use on local machines that may have a limit to their `/var` folder
```
docker pull chaddfrasier/pie-usgs:latest
```

For the server edition (~22GB) with full Base ISIS data preinstalled.
    - For a server implimentation or a system with memory-swap defaults.
```
docker pull chaddfrasier/pie-usgs:baseserver
```

### Running

Running with defaults.
```
docker run --rm -p 8080:8080 chaddfrasier/pie-usgs:<tag>
```

Running with custom container name.
```
docker run --rm -p 8080:8080 chaddfrasier/pie-usgs:<tag> -n <custom-name>
```

### Stopping

Stopping a default container
```
docker kill chaddfrasier/pie-usgs:<tag>
```

Stopping a custom named container.
```
docker kill <custom-name>
```
