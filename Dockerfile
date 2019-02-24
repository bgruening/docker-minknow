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
    apt-get install -y libasound2 libgconf-2-4 libxss-dev libgtk-3-0 libnss3 libatomic1 libusb-1.0-0-dev usbutils \
    export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer  /var/log/

USER developer
ENV HOME /home/developer
CMD /opt/ui/MinKNOW
