This example uses GeoPackage as a source file

```
docker run --publish 8080:8080 -v .:/app -e HAKUNAPI_CONFIG_PATH="/app/administrative_areas_2023.properties" hakunapi
```
