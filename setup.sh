#!/bin/bash

WORKDIR=$(pwd)
IXPEEXTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" #absolute path

tar -xf "$IXPEEXTDIR"/cfitsio_latest.tar.gz --directory "$IXPEEXTDIR"

BUILD_NAME="cfitsio_build"
BUILD_DIR="$IXPEEXTDIR"/"$BUILD_NAME"
mkdir $BUILD_DIR

cd "$IXPEEXTDIR"/cfitsio
echo "Installing in: $BUILD_DIR"
./configure --prefix=$BUILD_DIR
echo "Start building..."
make shared
echo "Done."
echo "Installing..."
make install
echo "Cleaning source directory..."
make clean
echo "Done."
cd "$WORKDIR" #Leave the user in the initial directory
