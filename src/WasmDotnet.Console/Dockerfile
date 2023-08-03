FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
RUN apt update

# linker fix: error while loading shared libraries: libxml2.so.2: cannot open shared object file: No such file or directory
RUN apt install libxml2 -y  libxml2

WORKDIR /repo
COPY . .
RUN dotnet build "/repo/src/WasmDotnet.Console" -c Release -o /app/build

FROM scratch AS export-stage
COPY --from=build /app/build/WasmDotnet.Console.wasm .
