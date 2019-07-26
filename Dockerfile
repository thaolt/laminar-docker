FROM debian:buster-slim

RUN apt-get update

RUN apt-get install -y git cmake g++ gcc cmake libboost-dev

RUN cd /tmp && git clone https://github.com/ohwgiles/laminar.git

RUN apt-get install -y capnproto libcapnp-dev libsqlite3-0 libsqlite3-dev rapidjson-dev zlib1g-dev

RUN cd /tmp/laminar && mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/ ..

RUN cd /tmp/laminar/build && make && make install

RUN mkdir -p /var/lib/laminar

RUN apt-get purge -y cmake g++ gcc libboost-dev libsqlite3-dev rapidjson-dev zlib1g-dev libcapnp-dev

RUN apt-get autoremove -y

RUN apt-get install -y openssh-server

RUN apt-get clean

RUN rm -rf /tmp/laminar

EXPOSE 8080

ENTRYPOINT ["/usr/bin/laminard"]





