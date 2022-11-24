# Counter Backend using grpc

Regenerate gRPC code

```
protoc --dart_out=grpc:lib/src/generated -Iprotos protos/*
```

Before running the server you will need to install redis
You can do this with docker

```
docker run --name counter-redis -p 6379:6379 -d redis
```

Run the server

```
dart bin/server.dart
```