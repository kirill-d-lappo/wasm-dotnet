# run from project root

# reqs:
# * docker buildx enabled
# * experimental features in docker:
#   * use containderd to pull images
#   * wasm support

set -e

mkdir -p ./out/console

# Just in case
# DOCKER_BUILDKIT=1

# bug: https://github.com/docker/roadmap/issues/426#issuecomment-1609837552
# BUILDX_NO_DEFAULT_ATTESTATIONS=1

# sdk docker image 7.0 does not support wasm runtime, so two step build
docker buildx build --output ./out/console -f ./src/WasmDotnet.Console/Dockerfile .

BUILDX_NO_DEFAULT_ATTESTATIONS=1 docker build --platform wasi/wasm -f ./src/WasmDotnet.Console/wasm.Dockerfile -t wasm.dotnet/console .
