# docker-pie
Container for PIE

## Update Notes
---------------
1. Container sets a non-root user using [tini](https://github.com/krallin/tini/#tini---a-tiny-but-valid-init-for-containers).
2. [Github Project](https://github.com/ChaddFrasier/PIE/projects/11)

### Building
```{bash}
$ docker build --rm -m "22G" --memory-swap "-1" -t chaddfrasier/pie-usgs:latest .
```

### Running
```{bash}
$ docker run --rm -d -p 8080:8080 --name pie chaddfrasier/pie-usgs:latest
```

### Stopping
```{bash}
$ docker kill pie
```