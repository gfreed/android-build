#!/bin/bash
DIR=$(dirname $(readlink -f $0))
docker build -t android-build .
docker run -i -v $DIR/../android-source:/srv/android -v $DIR/../ccache:/srv/ccache -t android-build /bin/bash
