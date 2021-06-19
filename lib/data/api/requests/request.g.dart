// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request(
    query: json['query'] as String,
    variables: json['variables'] as String?,
    operationName: json['operationName'] as String,
  );
}

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'query': instance.query,
      'variables': instance.variables,
      'operationName': instance.operationName,
    };
