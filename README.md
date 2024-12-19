# Blue-Space
An open-source BLE beacon gateway based on ZephyrProject

# Getting Started

How to build the docker image for the zephyr build environment
```bash
make docker-build-image
```

How to enter the zephyr container
```bash
make docker-run-container
```

How to build the firmware
```bash
west build -b nrf5340dk/nrf5340/cpuapp -p always blue-space
```

How to flash the firmware
```bash
west flash
```