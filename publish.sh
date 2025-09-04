#!/bin/env bash
jaspr build && jaspr build --sitemap-domain https://daazed.dev
sudo sh -c '
  systemctl stop nginx;
  rm -rf /var/www/daazed.dev && mkdir -p /var/www/daazed.dev;
  cp -al ./build/jaspr/* /var/www/daazed.dev/;
  systemctl start nginx;
'
