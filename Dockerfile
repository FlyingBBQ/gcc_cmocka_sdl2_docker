FROM gcc:latest

RUN apt-get update && apt-get install -y \
    cmake

# install SDL2 from source
RUN wget https://libsdl.org/release/SDL2-2.0.12.tar.gz \
    && tar -zxf SDL2-2.0.12.tar.gz \
    && cd SDL2-2.0.12 \
    && mkdir build && cd build \
    && ../configure && make -j$(nproc) \
    && make install

# install SDL2_image from source
RUN wget https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz \
    && tar -zxf SDL2_image-2.0.5.tar.gz \
    && cd SDL2_image-2.0.5 \
    && mkdir build && cd build \
    && ../configure && make -j$(nproc) \
    && make install

# install the cmocka test framework from source
RUN wget https://cmocka.org/files/1.1/cmocka-1.1.5.tar.xz \
    && tar -xf cmocka-1.1.5.tar.xz \
    && cd cmocka-1.1.5 \
    && mkdir build && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug .. \
    && make install
