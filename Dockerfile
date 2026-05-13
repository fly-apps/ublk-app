FROM ubuntu:24.04 as builder
RUN apt-get update -qq && \
  apt-get install -qy git build-essential libtool automake autoconf g++ pkg-config liburing-dev
RUN git clone --depth 1 https://github.com/ublk-org/ublksrv 
WORKDIR /ublksrv
RUN autoreconf -i
RUN ./configure
RUN make DESTDIR=/build install

FROM ubuntu:24.04
RUN apt-get update -qq && apt-get install -qy kmod liburing2
COPY --from=builder /build/. /
RUN ldconfig
ADD /start.sh /
CMD ["/start.sh"]
