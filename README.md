https://img.shields.io/docker/automated/bgruening/minknow.svg

# Docker container that can be used to run a local MinKNOW installation

The following assumes that the ONT package is install on your host system in /opt, which is the normal recommended way how to install the software.

Run with:

```bash
docker run -ti --rm 
   -e DISPLAY=$DISPLAY
   -v /tmp/:/tmp/
   -v /opt/:/opt/
   -v /dev/bus/usb:/dev/bus/usb
   --net=host
   --privileged
   bgruening/minknow
```
