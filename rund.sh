#!/bin/bash
#
# Build and start Dockerized Memoriali Sample Web Page/App in background as a daemon.
#
docker build -t cipdemoweb .
docker run -d --net=host cipdemoweb
#