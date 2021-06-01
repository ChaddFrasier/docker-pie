# docker-pie
Container for PIE

## Updates
1. **06/01/2021**- Tiff / Cub Exportation is operational.
1. **05/18/2021**- PIE accepted into Planetary Data Conference 2021.
1. **04/23/2021**- SVG file export is working well with Inkscape and browsers.
2. **01/15/2021**- Fixed Web-Fonts errors for Ubuntu.
3. **12/30/2020**- Container sets a non-root user using [tini](https://github.com/krallin/tini/#tini---a-tiny-but-valid-init-for-containers).

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