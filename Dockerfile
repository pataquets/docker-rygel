FROM pataquets/gstreamer:bionic

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      rygel \
      rygel-gst-launch \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

ENTRYPOINT [ "rygel" ]
#CMD [ "-h" ]
