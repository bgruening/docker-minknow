![](https://img.shields.io/docker/automated/bgruening/minknow.svg)

# Docker container that can be used to run a local MinKNOW installation

If you are running Ubuntu 18.10 or an other unsupported Linux version you will have hard time to get the MinKNOW software working.
Assuming you manage to get MinKNOW installed on your unsupported Linux system, which was easy in my case with 18.10, this container helps you to also run the MinKNOW. 

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
