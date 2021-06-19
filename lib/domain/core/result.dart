import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({T? value}) = Success<T>;
  const factory Result.error({String? message}) = Error<T>;
}
