#!/bin/sh
npm install --global pm2
npm install
npm run build
pm2-runtime start npm -- start
exec $@