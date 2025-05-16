#!/bin/bash
jaspr clean && jaspr build
rm -rf /var/www/daazed.dev/*
cp -r ./build/jaspr/* /var/www/daazed.dev/
cp -r ./assets/* /var/www/daazed.dev/assets/
