///
//  Generated code. Do not modify.
//  source: counter.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'counter.pb.dart' as $0;
export 'counter.pb.dart';

class CounterServiceClient extends $grpc.Client {
  static final _$getCounter = $grpc.ClientMethod<$0.CounterRequest, $0.Counter>(
      '/CounterService/getCounter',
      ($0.CounterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Counter.fromBuffer(value));
  static final _$incrementCounter = $grpc.ClientMethod<$0.Counter, $0.Counter>(
      '/CounterService/incrementCounter',
      ($0.Counter value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Counter.fromBuffer(value));

  CounterServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Counter> getCounter($0.CounterRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getCounter, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Counter> incrementCounter($0.Counter request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$incrementCounter, request, options: options);
  }
}

abstract class CounterServiceBase extends $grpc.Service {
  $core.String get $name => 'CounterService';

  CounterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CounterRequest, $0.Counter>(
        'getCounter',
        getCounter_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.CounterRequest.fromBuffer(value),
        ($0.Counter value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Counter, $0.Counter>(
        'incrementCounter',
        incrementCounter_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Counter.fromBuffer(value),
        ($0.Counter value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Counter> getCounter_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CounterRequest> request) async* {
    yield* getCounter(call, await request);
  }

  $async.Future<$0.Counter> incrementCounter_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Counter> request) async {
    return incrementCounter(call, await request);
  }

  $async.Stream<$0.Counter> getCounter(
      $grpc.ServiceCall call, $0.CounterRequest request);
  $async.Future<$0.Counter> incrementCounter(
      $grpc.ServiceCall call, $0.Counter request);
}
