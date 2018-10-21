
# geonames data

a few simple scripts to download and load geonames data into a local pg database - http://www.geonames.org/.

online data sources are:

* http://download.geonames.org/export/zip/
* http://download.geonames.org/export/dump/


---

## full setup

clone the repo and then run - 

```
./bin/geo_full_setup.sh
```

---

## appendix

### docker setup

the script below will:

* run postgres 9.5 
* with the name `geo` 
* in the background
* with port 5432 exposed to the host
* a docker-managed volume to persist data across container starts
* and a bind mount from `$REPO_ROOT/data` on the host to `/data` on the container for sharing data

```
docker run -d \
    -p 5432:5432 \
    --name geopg \
    -v geopg:/var/lib/postgresql \
    -v $HOME/repos/data-geonames/data:/data \
    postgres:9.5 \
    postgres -c 'listen_addresses=*'
```

### geonames API usage

the geonames api has little to do with this repo or the database it loads, but you can call the geonames api directly for up to 30k credits in a day (2000 max per hour).

* create a user account to call the API - http://www.geonames.org/login
* browse the documentation - http://www.geonames.org/export/

examples:

* http://api.geonames.org/postalCodeSearchJSON?formatted=true&postalcode=20500&maxRows=10&style=full&username=demo
* http://api.geonames.org/geocodeJSON?q=1600 Pennsylvania Ave NW, Washington, DC 20500&username=demo
* http://api.geonames.org/postalCodeLookupJSON?formatted=true&postalcode=20500&country=US&style=full&username=demo
* http://api.geonames.org/geoCodeAddress?formatted=true&postalcode=20500&country=US&style=full&username=demo

