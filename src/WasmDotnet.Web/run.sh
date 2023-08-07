dotnet build -c Release --force
wasmtime ./bin/Release/net7.0/WasmDotnet.Web.wasm --tcplisten localhost:8080 --env ASPNETCORE_URLS=http://0.0.0.0:8080
