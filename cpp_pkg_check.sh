#!/usr/bin/env bash

set -e

PKG_NAME=$1

if [ -z "$PKG_NAME" ]; then
    echo "Usage: $0 <pkg_name>"
    exit 1
fi

if [ -e /usr/include/$PKG_NAME ]; then
    echo "Found $PKG_NAME in /usr/include/"
else
    echo "Not found $PKG_NAME in /usr/include/"
fi

if [ -e /usr/local/include/$PKG_NAME ]; then
    echo "Found $PKG_NAME in /usr/local/include/"
else
    echo "Not found $PKG_NAME in /usr/local/include/"
fi

echo "Check '.so' files:"
ldconfig -p |grep $PKG_NAME