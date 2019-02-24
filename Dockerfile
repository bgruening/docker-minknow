# The installation assume that the ONT package is install on your host system in /opt (the normal recommended way how to install the software)
# Run with:
# docker run -ti --rm 
#   -e DISPLAY=$DISPLAY
#   -v /tmp/:/tmp/
#   -v /opt/:/opt/
#   -v /dev/bus/usb:/dev/bus/usb
#   --net=host
#   --privileged
#   minknow

FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y libasound2 libgconf-2-4 libxss-dev libgtk-3-0 libnss3 libatomic1 libusb-1.0-0-dev usbutils && \
    export uid=1000 gid=1000 && \
    mkdir -p /home/dev && \
    mkdir -p /etc/sudoers.d && \
    echo "dev:x:${uid}:${gid}:Developer,,,:/home/dev:/bin/bash" >> /etc/passwd && \
    echo "dev:x:${uid}:" >> /etc/group && \
    echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
    chmod 0440 /etc/sudoers.d/dev && \
    chown ${uid}:${gid} -R /home/dev  /var/log/

USER dev
ENV HOME /home/dev
CMD /opt/ui/MinKNOW
