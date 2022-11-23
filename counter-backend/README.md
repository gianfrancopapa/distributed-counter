# Counter Backend using grpc

Regenerate gRPC code

```
protoc --dart_out=grpc:lib/src/generated -Iprotos protos/*
```

Run the server

```
dart bin/server.dart
```