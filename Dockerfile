FROM pataquets/gstreamer:focal

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      rygel \
      rygel-gst-launch \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN \
  cp -v --preserve /etc/rygel.conf /etc/rygel.conf.dpkg-dist \
  && \
  sed --null-data -i \
    's/\[GstLaunch\]\nenabled=false/\[GstLaunch\]\nenabled=true/' \
    /etc/rygel.conf \
  && \
  nl /etc/rygel.conf

ENTRYPOINT [ "rygel" ]
#CMD [ "-h" ]
