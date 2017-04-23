#!/bin/bash
cd "${0%/*}"
docker build -t myhello:1 .
docker run --name hello1 -p 81:3000 -d myhello:1
