#!/bin/bash
. VERSION && echo "tags: $TAGS"
for t in $TAGS; do
   docker image tag images.canfar.net/lsst/lsst_v19_0_0:0.1 images.canfar.net/lsst/lsst_v19_0_0:0.1
done
unset TAGS
docker image list images.canfar.net/lsst/lsst_v19_0_0
