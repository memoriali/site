#!/bin/bash
#
# Build and start Dockerized Memoriali Sample Web Page/App in interactive mode
#
docker build -t cipdemoweb .
docker run -it --net=host cipdemoweb
#