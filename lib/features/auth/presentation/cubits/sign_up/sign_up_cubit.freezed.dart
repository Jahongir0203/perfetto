// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  RequestStatus? get status => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  String? get phoneErrorText => throw _privateConstructorUsedError;
  String? get nameErrorText => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {RequestStatus? status,
      bool isAvailable,
      String? phoneErrorText,
      String? nameErrorText,
      String? errorText});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isAvailable = null,
    Object? phoneErrorText = freezed,
    Object? nameErrorText = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneErrorText: freezed == phoneErrorText
          ? _value.phoneErrorText
          : phoneErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      nameErrorText: freezed == nameErrorText
          ? _value.nameErrorText
          : nameErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestStatus? status,
      bool isAvailable,
      String? phoneErrorText,
      String? nameErrorText,
      String? errorText});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isAvailable = null,
    Object? phoneErrorText = freezed,
    Object? nameErrorText = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_$SignUpStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneErrorText: freezed == phoneErrorText
          ? _value.phoneErrorText
          : phoneErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      nameErrorText: freezed == nameErrorText
          ? _value.nameErrorText
          : nameErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl implements _SignUpState {
  const _$SignUpStateImpl(
      {this.status,
      this.isAvailable = false,
      this.phoneErrorText = null,
      this.nameErrorText = null,
      this.errorText = null});

  @override
  final RequestStatus? status;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final String? phoneErrorText;
  @override
  @JsonKey()
  final String? nameErrorText;
  @override
  @JsonKey()
  final String? errorText;

  @override
  String toString() {
    return 'SignUpState(status: $status, isAvailable: $isAvailable, phoneErrorText: $phoneErrorText, nameErrorText: $nameErrorText, errorText: $errorText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.phoneErrorText, phoneErrorText) ||
                other.phoneErrorText == phoneErrorText) &&
            (identical(other.nameErrorText, nameErrorText) ||
                other.nameErrorText == nameErrorText) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, isAvailable,
      phoneErrorText, nameErrorText, errorText);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {final RequestStatus? status,
      final bool isAvailable,
      final String? phoneErrorText,
      final String? nameErrorText,
      final String? errorText}) = _$SignUpStateImpl;

  @override
  RequestStatus? get status;
  @override
  bool get isAvailable;
  @override
  String? get phoneErrorText;
  @override
  String? get nameErrorText;
  @override
  String? get errorText;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
