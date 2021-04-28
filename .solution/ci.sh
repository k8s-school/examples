#!/bin/bash

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)

cp $DIR/../*.yaml .

./QUEUE-install.sh
./QUEUE-test.sh
