FROM alpine:3.13.1

RUN apk -U add cmake gcc make musl-dev gd-dev wget openssl

ENV LIBANSILOVE_VERSION="1.2.8"
ENV ANSILOVE_VERSION="4.1.4"

RUN wget --no-check-certificate "https://github.com/ansilove/libansilove/archive/${LIBANSILOVE_VERSION}.tar.gz" \
    && tar -xvf "${LIBANSILOVE_VERSION}.tar.gz" \
    && cd "libansilove-${LIBANSILOVE_VERSION}" \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install \
    && cd ../../ \
    && rm -rf "libansilove-${LIBANSILOVE_VERSION}" "${LIBANSILOVE_VERSION}.tar.gz"

RUN wget --no-check-certificate "https://github.com/ansilove/ansilove/archive/${ANSILOVE_VERSION}.tar.gz" \
    && tar -xvf "${ANSILOVE_VERSION}.tar.gz" \
    && cd "ansilove-${ANSILOVE_VERSION}" \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install \
    && cd ../../ \
    && rm -rf "ansilove-${ANSILOVE_VERSION}" "${ANSILOVE_VERSION}.tar.gz"

RUN /sbin/ldconfig -v

CMD ["ansilove"]