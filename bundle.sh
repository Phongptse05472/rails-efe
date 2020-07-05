#!/bin/sh

set -e

bundle check || bundle install --binstubs="$BUNDLE_BIN" --jobs 10 --retry 3

exec "$@"