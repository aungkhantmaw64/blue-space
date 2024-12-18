FROM debian:bookworm

RUN apt-get update && apt-get install -y --no-install-recommends git cmake ninja-build gperf \
    ccache dfu-util device-tree-compiler wget \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel python3-venv \
    xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1 minicom

COPY ./tools/install-scripts/install-zephyr.sh ./install-zephyr.sh

ENV ZEPHYR_PROJECT_PATH=/opt/zephyrproject
ENV APP_PATH=/opt/zephyrproject/app 

RUN ./install-zephyr.sh

RUN wget https://github.com/NordicSemiconductor/nrf-udev/releases/download/v1.0.1/nrf-udev_1.0.1-all.deb

RUN apt-get install -y udev && dpkg -i nrf-udev_1.0.1-all.deb

RUN wget https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-10-x-x/10-24-2/nrf-command-line-tools_10.24.2_amd64.deb

RUN /lib/systemd/systemd-udevd --daemon && dpkg -i nrf-command-line-tools_10.24.2_amd64.deb && \
    apt install -y /opt/nrf-command-line-tools/share/JLink_Linux_V794e_x86_64.deb --fix-broken

WORKDIR ${APP_PATH} 

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]