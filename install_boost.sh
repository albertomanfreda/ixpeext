#!/bin/bash

WORKDIR=$(pwd)
IXPEEXTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" #absolute path

# Version of boost
BOOST_VERSION=1_63_0

#Compiler
CC=gcc

# Extract the compressed package
tar -xf "$IXPEEXTDIR"/boost_"$BOOST_VERSION".tar.bz2 --directory "$IXPEEXTDIR"

# Boost root dir
BOOST_ROOT="$IXPEEXTDIR"/boost_"$BOOST_VERSION"

# The Boost.Build tool will be installed here
B2_INSTALL_DIR="$BOOST_ROOT"/build

mkdir -p "$B2_INSTALL_DIR"

# Build Boost.Build
cd "$BOOST_ROOT"/tools/build
./bootstrap.sh
./b2 install --prefix="$B2_INSTALL_DIR"

# Use Boost.Build to build everything else
cd "$BOOST_ROOT"
"$B2_INSTALL_DIR"/bin/b2 toolset="$CC" --with-log --with-program_options stage

#Leave the user in the intial directory
cd "$WORKDIR"
