#!/bin/bash
wasm=false

sudo systemctl stop nginx

if [ $# -eq 0 ]; then
    jaspr clean
    jaspr build
else
    while [ "$1" != "" ]; do
        case $1 in
            --wasm)
                wasm=true
                ;;
            *)
                echo "Use --wasm for experimental-wasm build"
                exit 1
                ;;
        esac
        shift
    done

    jaspr clean
    if [ "$wasm" = true ]; then
        jaspr build --experimental-wasm
    fi
fi

rm -rf /var/www/daazed.dev/*
cp -al ./build/jaspr/* /var/www/daazed.dev/

