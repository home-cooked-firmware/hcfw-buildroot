#!/bin/bash

set -e

BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${BOARD_DIR})"
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
ROOTPATH="${BOARD_DIR}"

# Create output directories for boot resources and boot screen partition files.
mkdir -p "${BINARIES_DIR}/partitions"
mkdir -p "${BINARIES_DIR}/partitions/boot"
mkdir -p "${BINARIES_DIR}/partitions/boot-resource"
mkdir -p "${BINARIES_DIR}/partitions/udisk"
mkdir -p "${BINARIES_DIR}/partitions/user-data"

cp -a "${BOARD_DIR}/partitions/boot/." "${BINARIES_DIR}/partitions/boot"
cp -a "${BOARD_DIR}/partitions/boot-resource/." "${BINARIES_DIR}/partitions/boot-resource"
cp -a "${BOARD_DIR}/partitions/udisk/." "${BINARIES_DIR}/partitions/udisk"
cp -a "${BOARD_DIR}/partitions/user-data/." "${BINARIES_DIR}/partitions/user-data"

# Delete existing Genimage tmp directory if one exists, then run Genimage.
rm -rf "${GENIMAGE_TMP}"
genimage \
  --rootpath "${BINARIES_DIR}" \
  --tmppath "${GENIMAGE_TMP}"    \
  --inputpath "${BINARIES_DIR}"  \
  --outputpath "${BINARIES_DIR}" \
  --config "${GENIMAGE_CFG}"

exit $?
