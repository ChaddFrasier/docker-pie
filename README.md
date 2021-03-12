# docker-pie
Container for PIE

## Updates
1. **01/15/2021**- Fixed Web-Fonts errors for Ubuntu
1. **12/30/2020**- Container sets a non-root user using [tini](https://github.com/krallin/tini/#tini---a-tiny-but-valid-init-for-containers).

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