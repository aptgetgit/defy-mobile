// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../account_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountMetadata {
  String get label => throw _privateConstructorUsedError;
  Uri get iconUri => throw _privateConstructorUsedError;
  AccountAddress get accountAddress => throw _privateConstructorUsedError;

  /// Create a copy of AccountMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountMetadataCopyWith<AccountMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountMetadataCopyWith<$Res> {
  factory $AccountMetadataCopyWith(
          AccountMetadata value, $Res Function(AccountMetadata) then) =
      _$AccountMetadataCopyWithImpl<$Res, AccountMetadata>;
  @useResult
  $Res call({String label, Uri iconUri, AccountAddress accountAddress});

  $AccountAddressCopyWith<$Res> get accountAddress;
}

/// @nodoc
class _$AccountMetadataCopyWithImpl<$Res, $Val extends AccountMetadata>
    implements $AccountMetadataCopyWith<$Res> {
  _$AccountMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? iconUri = null,
    Object? accountAddress = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      iconUri: null == iconUri
          ? _value.iconUri
          : iconUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as AccountAddress,
    ) as $Val);
  }

  /// Create a copy of AccountMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountAddressCopyWith<$Res> get accountAddress {
    return $AccountAddressCopyWith<$Res>(_value.accountAddress, (value) {
      return _then(_value.copyWith(accountAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountMetadataImplCopyWith<$Res>
    implements $AccountMetadataCopyWith<$Res> {
  factory _$$AccountMetadataImplCopyWith(_$AccountMetadataImpl value,
          $Res Function(_$AccountMetadataImpl) then) =
      __$$AccountMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, Uri iconUri, AccountAddress accountAddress});

  @override
  $AccountAddressCopyWith<$Res> get accountAddress;
}

/// @nodoc
class __$$AccountMetadataImplCopyWithImpl<$Res>
    extends _$AccountMetadataCopyWithImpl<$Res, _$AccountMetadataImpl>
    implements _$$AccountMetadataImplCopyWith<$Res> {
  __$$AccountMetadataImplCopyWithImpl(
      _$AccountMetadataImpl _value, $Res Function(_$AccountMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? iconUri = null,
    Object? accountAddress = null,
  }) {
    return _then(_$AccountMetadataImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      iconUri: null == iconUri
          ? _value.iconUri
          : iconUri // ignore: cast_nullable_to_non_nullable
              as Uri,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as AccountAddress,
    ));
  }
}

/// @nodoc

class _$AccountMetadataImpl extends _AccountMetadata {
  const _$AccountMetadataImpl(
      {required this.label,
      required this.iconUri,
      required this.accountAddress})
      : super._();

  @override
  final String label;
  @override
  final Uri iconUri;
  @override
  final AccountAddress accountAddress;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountMetadataImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.iconUri, iconUri) || other.iconUri == iconUri) &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, iconUri, accountAddress);

  /// Create a copy of AccountMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountMetadataImplCopyWith<_$AccountMetadataImpl> get copyWith =>
      __$$AccountMetadataImplCopyWithImpl<_$AccountMetadataImpl>(
          this, _$identity);
}

abstract class _AccountMetadata extends AccountMetadata {
  const factory _AccountMetadata(
      {required final String label,
      required final Uri iconUri,
      required final AccountAddress accountAddress}) = _$AccountMetadataImpl;
  const _AccountMetadata._() : super._();

  @override
  String get label;
  @override
  Uri get iconUri;
  @override
  AccountAddress get accountAddress;

  /// Create a copy of AccountMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountMetadataImplCopyWith<_$AccountMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
