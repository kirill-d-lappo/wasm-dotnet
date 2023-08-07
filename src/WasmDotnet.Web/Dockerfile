FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
WORKDIR /repo
COPY . .
RUN dotnet build "/repo/src/WasmDotnet.Web" -c Release -o /app/build

FROM scratch AS export-stage
COPY --from=build /app/build/WasmDotnet.Web.wasm .
