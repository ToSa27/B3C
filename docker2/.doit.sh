#!/bin/bash
cd "${0%/*}"
docker build -t myhello:2 .
docker run --name hello2 -p 82:3000 -d myhello:2
