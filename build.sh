#!/bin/sh
set -e

pushd `dirname $0` > /dev/null
CURRENT_DIR=`pwd`
popd > /dev/null
# ================================================================ #

export PATH_OF_AFL="/tmp/afl"
# ================================================================ #

# AFL Config
export AFL_USE_ASAN=1

export CC="${PATH_OF_AFL}/bin/afl-clang"
export CXX="${PATH_OF_AFL}/bin/afl-clang++"
# ================================================================ #

make clean
make
# ================================================================ #
