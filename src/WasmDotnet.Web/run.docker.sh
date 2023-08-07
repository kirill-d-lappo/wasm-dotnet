#!/usr/bin/env bash

set -e

# wasmtime
# doesnt work
# how to pass "--tcplisten localhost:8080" ?
# as of 2023/08/07 - no way: https://github.com/containerd/runwasi/issues/45
# ===
# manually i works:
# > wasmtime ./out/web/WasmDotnet.Web.wasm --tcplisten localhost:8080 --env ASPNETCORE_URLS=http://0.0.0.0:8080
docker run --rm -n "dotnet-web-wasmtime" -p 8080 --runtime=io.containerd.wasmtime.v1 --platform=wasi/wasm wasm.dotnet/web

# wasmedge
# doesn't work, returns 255 exit code in docker, no output
docker run --rm -n "dotnet-web-wasmedge" -p 8080 --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm wasm.dotnet/web
