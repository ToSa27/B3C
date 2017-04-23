#!/bin/bash
cd "${0%/*}"
docker run --name chatdb -d mongo
docker run --name chatweb -p 83:3000 --link chatdb:db -d rocket.chat
