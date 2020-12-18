# docker-pie
Docker Image for installing and running the server.

### PIE
A planetary image editor built for the USGS researchers with the goal of simplifying the research publication process.

### Requirements
1. [Install](https://docs.docker.com/engine/install/) Docker CE for your OS.
2. ~ 21GB of free disk space.

### Install
Pull down the image version you want to use by running the terminal command below.

**Note: The *latest* tag has been removed to follow Docker's best practices.**
```{bash}
$ docker pull chaddfrasier/pie-usgs:<version>
<version>: Pulling from chaddfrasier/pie-usgs
...
...
...
```

### Updating
If you wish to update the docker container first run `docker images` to see which tag you have installed. Then just re-run the pull command for the tag you have downloaded already.

```{bash}
$ docker images
REPOSITORY              TAG         IMAGE ID      CREATED       SIZE
chaddfrasier/pie-usgs   <version>   30841eb97c08  23 hours ago  21.9GB
ubuntu                  bionic      56def654ec22  7 weeks ago   63.2MB

$ docker pull chaddfrasier/pie-usgs:<version>
<version>: Pulling from chaddfrasier/pie-usgs
...
...
...

```

### Running
Running with options.
| Option Flag | Description |
| -------- | -------- |
| --rm | Remove the container automagically when it finishes running or stops with errors |
| --name | Add a container name |
| -p | *host port* : *container port* |

Running container.
```{bash}
$ docker run --rm --name pie -p 8080:8080 chaddfrasier/pie-usgs:<version>
```

### Stopping
Stopping a default container
```{bash}
$ docker kill chaddfrasier/pie-usgs:<version>
chaddfrasier/pie-usgs:<version>
```

Stopping a custom named container.
```{bash}
$ docker kill <custom-name>
<custom-name>
```

### Contribute
Source code for the server is on [GitHub](https://github.com/ChaddFrasier/PIE).