#!/bin/sh
rm -rf output-netshoot/*
packer build \
    --var-file="netshoot-builder.json" \
    --var-file="netshoot-1.0.json" \
    netshoot.json
