#! /bin/bash

export SCRIPTPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DATA_DIR=$SCRIPTPATH/../data/geonames
export SQL_DIR=$SCRIPTPATH/../sql

echo "creating the data directory if it doesn't exist"

mkdir -p $DATA_DIR
mkdir -p $DATA_DIR/postal

echo "clearing out the data directory"

rm -rf $DATA_DIR/*.*
rm -rf $DATA_DIR/postal/*.*

echo "downloading files from geonames"

curl -L "http://download.geonames.org/export/dump/US.zip" > $DATA_DIR/US.zip
curl -L "http://download.geonames.org/export/dump/cities1000.zip" > $DATA_DIR/cities1000.zip
curl -L "http://download.geonames.org/export/dump/cities5000.zip" > $DATA_DIR/cities5000.zip
curl -L "http://download.geonames.org/export/dump/cities15000.zip" > $DATA_DIR/cities15000.zip
curl -L "http://download.geonames.org/export/dump/alternateNamesV2.zip" > $DATA_DIR/alternateNamesV2.zip
curl -L "http://download.geonames.org/export/dump/hierarchy.zip" > $DATA_DIR/hierarchy.zip
curl -L "http://download.geonames.org/export/dump/featureCodes_en.txt" > $DATA_DIR/featureCodes.txt
curl -L "http://download.geonames.org/export/dump/timeZones.txt" > $DATA_DIR/timeZones.txt
curl -L "http://download.geonames.org/export/dump/countryInfo.txt" > $DATA_DIR/countryInfo.txt
curl -L "http://download.geonames.org/export/dump/admin1CodesASCII.txt" > $DATA_DIR/admin1CodesASCII.txt
curl -L "http://download.geonames.org/export/dump/admin2Codes.txt" > $DATA_DIR/admin2Codes.txt
curl -L "http://download.geonames.org/export/dump/adminCode5.zip" > $DATA_DIR/adminCode5.zip

curl -L "http://download.geonames.org/export/zip/US.zip" > $DATA_DIR/postal/US.zip

echo "unzipping zips"

unzip $DATA_DIR/US.zip -d $DATA_DIR
unzip $DATA_DIR/cities1000.zip -d $DATA_DIR
unzip $DATA_DIR/cities5000.zip -d $DATA_DIR
unzip $DATA_DIR/cities15000.zip -d $DATA_DIR
unzip $DATA_DIR/alternateNamesV2.zip -d $DATA_DIR
unzip $DATA_DIR/hierarchy.zip -d $DATA_DIR
unzip $DATA_DIR/adminCode5.zip -d $DATA_DIR

unzip $DATA_DIR/postal/US.zip -d $DATA_DIR/postal

echo "loading tables"

psql -h 0.0.0.0 -d postgres -U postgres -a -f $SQL_DIR/geo_initdb.sql
psql -h 0.0.0.0 -d geo -U postgres -a -f $SQL_DIR/geo_ddl.sql
psql -h 0.0.0.0 -d geo -U postgres -a -f $SQL_DIR/geo_load.sql

