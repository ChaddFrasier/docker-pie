# docker-pie
Docker Image for installing and running the server.

### PIE
A planetary image editor built for the USGS researchers with the goal of simplifying the research publication process.

### Requirements
1. [Install](https://docs.docker.com/engine/install/) Docker CE for your OS.
- If you want the smallest install you need ~ 2GB to install the server.
- If you want the full server you need ~ 15GB.

### Install

Pull down the image you want.

*latest* holds the server with no ISIS data included.
*fullserver* is a complete ISIS and GDAL server.
```
$ docker pull chaddfrasier/pie-usgs:<tag>
<tag>: Pulling from chaddfrasier/pie-usgs
...
...
...
```

### Updating
If you wish to update the docker container first run `docker images` to see which tag you have installed. Then just re-run the pull command for the tag you have downloaded already.

```
$ docker images
REPOSITORY              TAG         IMAGE ID      CREATED       SIZE
chaddfrasier/pie-usgs   <tag>       30841eb97c08  23 hours ago  21.9GB
ubuntu                  bionic      56def654ec22  7 weeks ago   63.2MB

$ docker pull chaddfrasier/pie-usgs:<tag>
```


### Running
Running with defaults.
```
$ docker run --rm -p 8080:8080 chaddfrasier/pie-usgs:<tag>
```

Running with custom container name.
```
$ docker run --rm --name <custom-name> -p 8080:8080 chaddfrasier/pie-usgs:<tag>
```

### Stopping
Stopping a default container
```
$ docker kill chaddfrasier/pie-usgs:<tag>
chaddfrasier/pie-usgs:<tag>
```

Stopping a custom named container.
```
$ docker kill <custom-name>
<custom-name>
```

### Contribute
Source code for the server is on [GitHub](https://github.com/ChaddFrasier/PIE).