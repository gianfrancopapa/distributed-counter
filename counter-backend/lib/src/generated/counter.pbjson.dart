///
//  Generated code. Do not modify.
//  source: counter.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use counterRequestDescriptor instead')
const CounterRequest$json = const {
  '1': 'CounterRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `CounterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List counterRequestDescriptor = $convert.base64Decode('Cg5Db3VudGVyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use counterDescriptor instead')
const Counter$json = const {
  '1': 'Counter',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
  ],
};

/// Descriptor for `Counter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List counterDescriptor = $convert.base64Decode('CgdDb3VudGVyEhQKBXZhbHVlGAEgASgBUgV2YWx1ZQ==');
