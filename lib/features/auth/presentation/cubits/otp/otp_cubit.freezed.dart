// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpState {
  RequestStatus? get status => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isResend => throw _privateConstructorUsedError;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call(
      {RequestStatus? status, String? time, String? error, bool isResend});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? time = freezed,
    Object? error = freezed,
    Object? isResend = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isResend: null == isResend
          ? _value.isResend
          : isResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpStateImplCopyWith<$Res>
    implements $OtpStateCopyWith<$Res> {
  factory _$$OtpStateImplCopyWith(
          _$OtpStateImpl value, $Res Function(_$OtpStateImpl) then) =
      __$$OtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestStatus? status, String? time, String? error, bool isResend});
}

/// @nodoc
class __$$OtpStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpStateImpl>
    implements _$$OtpStateImplCopyWith<$Res> {
  __$$OtpStateImplCopyWithImpl(
      _$OtpStateImpl _value, $Res Function(_$OtpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? time = freezed,
    Object? error = freezed,
    Object? isResend = null,
  }) {
    return _then(_$OtpStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isResend: null == isResend
          ? _value.isResend
          : isResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OtpStateImpl implements _OtpState {
  const _$OtpStateImpl(
      {this.status, this.time, this.error = null, this.isResend = false});

  @override
  final RequestStatus? status;
  @override
  final String? time;
  @override
  @JsonKey()
  final String? error;
  @override
  @JsonKey()
  final bool isResend;

  @override
  String toString() {
    return 'OtpState(status: $status, time: $time, error: $error, isResend: $isResend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isResend, isResend) ||
                other.isResend == isResend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, time, error, isResend);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      __$$OtpStateImplCopyWithImpl<_$OtpStateImpl>(this, _$identity);
}

abstract class _OtpState implements OtpState {
  const factory _OtpState(
      {final RequestStatus? status,
      final String? time,
      final String? error,
      final bool isResend}) = _$OtpStateImpl;

  @override
  RequestStatus? get status;
  @override
  String? get time;
  @override
  String? get error;
  @override
  bool get isResend;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
