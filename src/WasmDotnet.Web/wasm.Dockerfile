# syntax=docker/dockerfile:1
FROM scratch
EXPOSE 8080
ENV ASPNETCORE_URLS=http://localhost:8080
WORKDIR /app
COPY ./out/web/WasmDotnet.Web.wasm /app/WasmDotnet.Web.wasm
ENTRYPOINT [ "/app/WasmDotnet.Web.wasm" ]
