Google My Maps to Organic Maps (MAPS.ME) KML converter
======================================================

This tool adapts KML files from Google My Maps
for use with [Organic Maps](https://organicmaps.app/) (and MAPS.ME),
striving to maintain color and icon accuracy.
Although Organic Maps supports fewer colors and icons,
the tool does its best to match the original as closely as possible.
Input on new icon mappings is appreciated.

Basically this tool is just a web wrapper around [mmmm](https://github.com/igrmk/mmmm) library.

Usage
-----

Go to [Mmmm](https://mmm.city) and convert your KML.

Development
-----------

### Back End

You can create a virtual environment for testing by executing the commands below:

    cd backend
    micromamba env create --prefix ./.venv --file environment.yml
    micromamba activate ./.venv

### Front End

You can build the front end by executing the commands below:

    cd frontend
    nvm use
    npm install
    npm run build

I use [Biome](https://biomejs.dev/) to check and lint the code.
You can run it this way:

    npx @biomejs/biome check
