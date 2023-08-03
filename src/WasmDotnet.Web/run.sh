dotnet build --force
wasmtime ./bin/Debug/net7.0/WasmDotnet.Web.wasm --tcplisten localhost:8080 --env ASPNETCORE_URLS=http://0.0.0.0:8080
