#!/bin/bash

pushd `dirname $0` > /dev/null
BASE_DIR=`pwd`
popd > /dev/null
# ================================================================ #

FUZZER=./afl-fuzz
TEST_CASES=$BASE_DIR/input
RESULT_DIR=$BASE_DIR/result
TARGET_APP=$BASE_DIR/decoder
DICT_PATH=$BASE_DIR/silk.dict
# ================================================================ #

# Clear
rm -rf $RESULT_DIR/*
# ================================================================ #

# Do Fuzzing
$FUZZER -i $TEST_CASES -o $RESULT_DIR -x $DICT_PATH -t 20000 $TARGET_APP @@ tmp.pcm
# ================================================================ #
