#!/bin/bash

# Find the directory we exist within
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ${DIR}

: ${NAME:="graphite-metrictank"}
VERSION="$(git describe --long --always)"
ARCH="$(uname -m)"

# wheezy, other sysvinit
BUILD_ROOT=${DIR}/build
BUILD="${BUILD_ROOT}/debian/wheezy"
PKG_DIR="${DIR}/build/pkg/debian/wheezy"
mkdir -p $PKG_DIR
PACKAGE_NAME="${PKG_DIR}/${NAME}-${VERSION}_${ARCH}.deb"

fpm \
  -t deb -s dir -C ${BUILD} -n ${NAME} -v $VERSION \
  --config-files /etc/graphite-metrictank/ \
  --config-files /etc/default/graphite-metrictank \
  -d libcairo2 \
  -d python \
  -d "libffi5 | libffi6" \
  --after-install ${DIR}/debian/scripts/post-install \
  --before-remove ${DIR}/debian/scripts/pre-remove \
  --after-remove ${DIR}/debian/scripts/post-remove \
  --url https://github.com/raintank/graphite-metrictank \
  --description 'finder plugin to use metrictank with graphite-api' \
  --license 'Apache 2.0' \
  -p ${PACKAGE_NAME} .

# ubuntu 14.04

BUILD="${BUILD_ROOT}/ubuntu/trusty"
PKG_DIR="${DIR}/build/pkg/ubuntu/trusty"
mkdir -p $PKG_DIR
PACKAGE_NAME="${PKG_DIR}/${NAME}-${VERSION}_${ARCH}.deb"


fpm \
  -t deb -s dir -C ${BUILD} -n ${NAME} -v $VERSION \
  --config-files /etc/graphite-metrictank/ \
  --config-files /etc/default/graphite-metrictank \
  --after-install ${DIR}/ubuntu/scripts/post-install.sh \
  -d libcairo2 \
  -d python \
  -d "libffi5 | libffi6" \
  --url https://github.com/raintank/graphite-metrictank \
  --description 'finder plugin to use metrictank with graphite-api' \
  --license 'Apache 2.0' \
  -p ${PACKAGE_NAME} .

# ubuntu 16.04

BUILD="${BUILD_ROOT}/ubuntu/xenial"
PKG_DIR="${DIR}/build/pkg/ubuntu/xenial"
mkdir -p $PKG_DIR
PACKAGE_NAME="${PKG_DIR}/${NAME}-${VERSION}_${ARCH}.deb"

fpm \
  -t deb -s dir -C ${BUILD} -n ${NAME} -v $VERSION \
  --config-files /etc/graphite-metrictank/ \
  --config-files /etc/default/graphite-metrictank \
  --after-install ${DIR}/ubuntu/scripts/post-install.sh \
  -d libcairo2 \
  -d python \
  -d "libffi5 | libffi6" \
  --url https://github.com/raintank/graphite-metrictank \
  --description 'finder plugin to use metrictank with graphite-api' \
  --license 'Apache 2.0' \
  -p ${PACKAGE_NAME} .

# debian jessie

BUILD="${BUILD_ROOT}/debian/jessie"
PKG_DIR="${DIR}/build/pkg/debian/jessie"
mkdir -p $PKG_DIR
PACKAGE_NAME="${PKG_DIR}/${NAME}-${VERSION}_${ARCH}.deb"

fpm \
  -t deb -s dir -C ${BUILD} -n ${NAME} -v $VERSION \
  --config-files /etc/graphite-metrictank/ \
  --config-files /etc/default/graphite-metrictank \
  --after-install ${DIR}/ubuntu/scripts/post-install.sh \
  -d libcairo2 \
  -d python \
  -d "libffi5 | libffi6" \
  --url https://github.com/raintank/graphite-metrictank \
  --description 'finder plugin to use metrictank with graphite-api' \
  --license 'Apache 2.0' \
  -p ${PACKAGE_NAME} .

# centos 6

BUILD="${BUILD_ROOT}/centos/6"
PKG_DIR="${DIR}/build/pkg/centos/6"
mkdir -p $PKG_DIR
PACKAGE_NAME="${PKG_DIR}/${NAME}-${VERSION}.el6.${ARCH}.rpm"

fpm \
  -t rpm -s dir -C ${BUILD} -n ${NAME} -v $VERSION \
  --config-files /etc/graphite-metrictank/ \
  --config-files /etc/default/graphite-metrictank \
  --after-install ${DIR}/centos/scripts/post-install.sh \
  -d cairo \
  -d libffi \
  --url https://github.com/raintank/graphite-metrictank \
  --description 'finder plugin to use metrictank with graphite-api' \
  --license 'Apache 2.0' \
  -p ${PACKAGE_NAME} .

# centos 7
BUILD="${BUILD_ROOT}/centos/7"
PKG_DIR="${DIR}/build/pkg/centos/7"
mkdir -p $PKG_DIR
PACKAGE_NAME="${PKG_DIR}/${NAME}-${VERSION}.el7.${ARCH}.rpm"

fpm \
  -t rpm -s dir -C ${BUILD} -n ${NAME} -v $VERSION \
  --config-files /etc/graphite-metrictank/ \
  --config-files /etc/default/graphite-metrictank \
  --after-install ${DIR}/centos/scripts/post-install.sh \
  -d cairo \
  -d libffi \
  --url https://github.com/raintank/graphite-metrictank \
  --description 'finder plugin to use metrictank with graphite-api' \
  --license 'Apache 2.0' \
  -p ${PACKAGE_NAME} .
