#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/blackducksoftware/synopsysctl/releases/download

dl() {
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=$4
    local platform="${os}-${arch}"
    local rfile="synopsysctl-${platform}-${ver}.${archive_type}"
    local url=$MIRROR/v$ver/$rfile
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep -e $rfile $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1

    # https://github.com/blackducksoftware/synopsysctl/releases/download/v2.1.3/CHECKSUM
    local url=$MIRROR/v$ver/CHECKSUM

    local lchecksums=$DIR/synopsysctl-${ver}-checksums
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $ver darwin amd64 zip
    dl $ver linux amd64 tar.gz
    dl $ver windows amd64 zip
}

dl_ver ${1:-3.0.1}
