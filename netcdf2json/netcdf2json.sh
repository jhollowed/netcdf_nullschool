#!/bin/bash

# location of this script
HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# location of grib2json executable
echo "locating grib2json..."
grib2json=${HERE}/../grib2json/grib2json-0.8.0-SNAPSHOT/bin/grib2json

# command line arg is the file to convert
echo "getting input netcdf file..."
NETCDF=$1
FILENAME=$(basename $NETCDF .nc)
GRIB="${FILENAME}.grb"
JSON="${FILENAME}.json"

# use CDO to convert NETCDF to GRIB
echo "converting to grib..."
cdo -f grb2 copy $NETCDF $GRIB

# use grib2json to convert to JSON
echo "converting to json..."
grib2json -d -n -o $JSON $GRIB

# move the data to the server's public data directory
echo "relocating data to public data directory..."
mv $GRIB ${HERE}/../public/data/weather/current

echo "done"



