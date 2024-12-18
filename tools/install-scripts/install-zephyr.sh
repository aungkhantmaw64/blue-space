#!/bin/bash
python3 -m venv ${ZEPHYR_PROJECT_PATH}/.venv 
source ${ZEPHYR_PROJECT_PATH}/.venv/bin/activate
pip install west
west init ${ZEPHYR_PROJECT_PATH}  
cd ${ZEPHYR_PROJECT_PATH}
west update 
west zephyr-export
west packages pip --install
cd ${ZEPHYR_PROJECT_PATH}/zephyr
west sdk install