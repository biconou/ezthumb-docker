FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget bzip2 \
    build-essential \
    libavformat-dev libavcodec-dev libswscale-dev libavutil-dev libgd-dev libfreetype6-dev libpng-dev libjpeg-dev zlib1g-dev \
    ca-certificates

WORKDIR /ezthumb
RUN wget https://github.com/xuminic/ezthumb/releases/download/RELEASE_3_6_7/ezthumb-3.6.7.tar.bz2 && tar -xjf ezthumb-3.6.7.tar.bz2

USER root
RUN cd ezthumb-3.6.7 && \
    ./configure CPPFLAGS="-I/usr/include/freetype2" && \
    make && \
    make install

WORKDIR /tmp
#CMD ["ezthumb","-g 2x4 *.mp4 *.mpg *.wmv *.avi"]
#CMD ["/bin/bash"]
CMD ["ls"]