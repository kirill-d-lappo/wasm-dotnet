# syntax=docker/dockerfile:1
FROM scratch
WORKDIR /app
COPY ./out/console/WasmDotnet.Console.wasm /app/WasmDotnet.Console.wasm
ENTRYPOINT [ "/app/WasmDotnet.Console.wasm" ]
