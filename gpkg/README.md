This example uses GeoPackage as a source file

Copy ../Dockerfile to hakunapi repo (https://github.com/nlsfi/hakunapi) then run
```
docker build . -t hakunapi
docker run --publish 8080:8080 -v <local path to this git repo>/gpkg:/mnt/mydata -e CONFIG_DIR="/mnt/mydata/" -e HAKUNAPI_CONFIG_PATH="/mnt/mydata/gpkg_example.properties" hakunapi
```
