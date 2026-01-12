#!/usr/bin/env bash
function cleanup {
    echo "Removing previous build artifacts"
    rm -rf build/ Firmware/autogen Firmware/build Firmware/.tup
    podman rm odrive-build-cont
}

function gc {
    cleanup
    podman rmi odrive-build-img
    podman image prune
}

function build {
    cleanup

    echo "Building the build-environment image"
    podman build -t odrive-build-image .

    echo "Build in container"
    podman run -it -v $(pwd):/ODrive --name odrive-build-cont odrive-build-image:latest
}

function usage {
    echo "usage: $0 (build | cleanup | gc)"
    echo
    echo "build   -- build in podman and extract the artifacts."
    echo "cleanup -- remove build artifacts from previous build"
    echo "gc      -- remove all build images and containers"
}

case $1 in
    build)
	build
	;;
    cleanup)
	cleanup
	;;
    gc)
	gc
	;;
    *)
	usage
	;;
esac
