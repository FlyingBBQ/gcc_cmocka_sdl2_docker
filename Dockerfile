FROM gcc:latest

RUN apt-get update && apt-get install -y \
    cmake

# install SDL2 from source
RUN hg clone https://hg.libsdl.org/SDL SDL \
    && cd SDL \
    && mkdir build \
    && cd build \
    && ../configure \
    && make install

# install the cmocka test framework from source
RUN wget https://cmocka.org/files/1.1/cmocka-1.1.5.tar.xz \
    && tar -xf cmocka-1.1.5.tar.xz \
    && cd cmocka-1.1.5 \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug .. \
    && make install
