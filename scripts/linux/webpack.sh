#!/bin/bash
cd ..
npm install --silent

rm -Rf meteor/react-build-generated

find meteor/public/assets -maxdepth 1 -mindepth 1 -not -name LEAVE_EMPTY \
    -exec rm -f '{}' \;

./node_modules/.bin/webpack --config webpack/production.config.js -p

find meteor/react-build-generated/client -maxdepth 1 -mindepth 1 -not -name main.js \
    -exec mv '{}' meteor/public/assets \;

find meteor/react-build-generated/server -maxdepth 1 -mindepth 1 -not -name main.js \
    -exec rm -f '{}' \;
