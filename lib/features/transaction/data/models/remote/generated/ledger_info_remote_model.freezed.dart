// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../ledger_info_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LedgerInfoRemoteModel _$LedgerInfoRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _LedgerInfoRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$LedgerInfoRemoteModel {
  int get chainId => throw _privateConstructorUsedError;
  String get epoch => throw _privateConstructorUsedError;
  String get ledgerVersion => throw _privateConstructorUsedError;
  String get oldestLedgerVersion => throw _privateConstructorUsedError;
  String get ledgerTimestamp =>
      throw _privateConstructorUsedError; // required String nodeRole,
  String get oldestBlockHeight => throw _privateConstructorUsedError;
  String get blockHeight => throw _privateConstructorUsedError;
  String? get gitHash => throw _privateConstructorUsedError;

  /// Create a copy of LedgerInfoRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LedgerInfoRemoteModelCopyWith<LedgerInfoRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerInfoRemoteModelCopyWith<$Res> {
  factory $LedgerInfoRemoteModelCopyWith(LedgerInfoRemoteModel value,
          $Res Function(LedgerInfoRemoteModel) then) =
      _$LedgerInfoRemoteModelCopyWithImpl<$Res, LedgerInfoRemoteModel>;
  @useResult
  $Res call(
      {int chainId,
      String epoch,
      String ledgerVersion,
      String oldestLedgerVersion,
      String ledgerTimestamp,
      String oldestBlockHeight,
      String blockHeight,
      String? gitHash});
}

/// @nodoc
class _$LedgerInfoRemoteModelCopyWithImpl<$Res,
        $Val extends LedgerInfoRemoteModel>
    implements $LedgerInfoRemoteModelCopyWith<$Res> {
  _$LedgerInfoRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LedgerInfoRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chainId = null,
    Object? epoch = null,
    Object? ledgerVersion = null,
    Object? oldestLedgerVersion = null,
    Object? ledgerTimestamp = null,
    Object? oldestBlockHeight = null,
    Object? blockHeight = null,
    Object? gitHash = freezed,
  }) {
    return _then(_value.copyWith(
      chainId: null == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      epoch: null == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as String,
      ledgerVersion: null == ledgerVersion
          ? _value.ledgerVersion
          : ledgerVersion // ignore: cast_nullable_to_non_nullable
              as String,
      oldestLedgerVersion: null == oldestLedgerVersion
          ? _value.oldestLedgerVersion
          : oldestLedgerVersion // ignore: cast_nullable_to_non_nullable
              as String,
      ledgerTimestamp: null == ledgerTimestamp
          ? _value.ledgerTimestamp
          : ledgerTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
      oldestBlockHeight: null == oldestBlockHeight
          ? _value.oldestBlockHeight
          : oldestBlockHeight // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as String,
      gitHash: freezed == gitHash
          ? _value.gitHash
          : gitHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LedgerInfoRemoteModelImplCopyWith<$Res>
    implements $LedgerInfoRemoteModelCopyWith<$Res> {
  factory _$$LedgerInfoRemoteModelImplCopyWith(
          _$LedgerInfoRemoteModelImpl value,
          $Res Function(_$LedgerInfoRemoteModelImpl) then) =
      __$$LedgerInfoRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int chainId,
      String epoch,
      String ledgerVersion,
      String oldestLedgerVersion,
      String ledgerTimestamp,
      String oldestBlockHeight,
      String blockHeight,
      String? gitHash});
}

/// @nodoc
class __$$LedgerInfoRemoteModelImplCopyWithImpl<$Res>
    extends _$LedgerInfoRemoteModelCopyWithImpl<$Res,
        _$LedgerInfoRemoteModelImpl>
    implements _$$LedgerInfoRemoteModelImplCopyWith<$Res> {
  __$$LedgerInfoRemoteModelImplCopyWithImpl(_$LedgerInfoRemoteModelImpl _value,
      $Res Function(_$LedgerInfoRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerInfoRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chainId = null,
    Object? epoch = null,
    Object? ledgerVersion = null,
    Object? oldestLedgerVersion = null,
    Object? ledgerTimestamp = null,
    Object? oldestBlockHeight = null,
    Object? blockHeight = null,
    Object? gitHash = freezed,
  }) {
    return _then(_$LedgerInfoRemoteModelImpl(
      chainId: null == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      epoch: null == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as String,
      ledgerVersion: null == ledgerVersion
          ? _value.ledgerVersion
          : ledgerVersion // ignore: cast_nullable_to_non_nullable
              as String,
      oldestLedgerVersion: null == oldestLedgerVersion
          ? _value.oldestLedgerVersion
          : oldestLedgerVersion // ignore: cast_nullable_to_non_nullable
              as String,
      ledgerTimestamp: null == ledgerTimestamp
          ? _value.ledgerTimestamp
          : ledgerTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
      oldestBlockHeight: null == oldestBlockHeight
          ? _value.oldestBlockHeight
          : oldestBlockHeight // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as String,
      gitHash: freezed == gitHash
          ? _value.gitHash
          : gitHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$LedgerInfoRemoteModelImpl extends _LedgerInfoRemoteModel {
  const _$LedgerInfoRemoteModelImpl(
      {required this.chainId,
      required this.epoch,
      required this.ledgerVersion,
      required this.oldestLedgerVersion,
      required this.ledgerTimestamp,
      required this.oldestBlockHeight,
      required this.blockHeight,
      this.gitHash})
      : super._();

  factory _$LedgerInfoRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerInfoRemoteModelImplFromJson(json);

  @override
  final int chainId;
  @override
  final String epoch;
  @override
  final String ledgerVersion;
  @override
  final String oldestLedgerVersion;
  @override
  final String ledgerTimestamp;
// required String nodeRole,
  @override
  final String oldestBlockHeight;
  @override
  final String blockHeight;
  @override
  final String? gitHash;

  @override
  String toString() {
    return 'LedgerInfoRemoteModel(chainId: $chainId, epoch: $epoch, ledgerVersion: $ledgerVersion, oldestLedgerVersion: $oldestLedgerVersion, ledgerTimestamp: $ledgerTimestamp, oldestBlockHeight: $oldestBlockHeight, blockHeight: $blockHeight, gitHash: $gitHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerInfoRemoteModelImpl &&
            (identical(other.chainId, chainId) || other.chainId == chainId) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.ledgerVersion, ledgerVersion) ||
                other.ledgerVersion == ledgerVersion) &&
            (identical(other.oldestLedgerVersion, oldestLedgerVersion) ||
                other.oldestLedgerVersion == oldestLedgerVersion) &&
            (identical(other.ledgerTimestamp, ledgerTimestamp) ||
                other.ledgerTimestamp == ledgerTimestamp) &&
            (identical(other.oldestBlockHeight, oldestBlockHeight) ||
                other.oldestBlockHeight == oldestBlockHeight) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.gitHash, gitHash) || other.gitHash == gitHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chainId,
      epoch,
      ledgerVersion,
      oldestLedgerVersion,
      ledgerTimestamp,
      oldestBlockHeight,
      blockHeight,
      gitHash);

  /// Create a copy of LedgerInfoRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerInfoRemoteModelImplCopyWith<_$LedgerInfoRemoteModelImpl>
      get copyWith => __$$LedgerInfoRemoteModelImplCopyWithImpl<
          _$LedgerInfoRemoteModelImpl>(this, _$identity);
}

abstract class _LedgerInfoRemoteModel extends LedgerInfoRemoteModel {
  const factory _LedgerInfoRemoteModel(
      {required final int chainId,
      required final String epoch,
      required final String ledgerVersion,
      required final String oldestLedgerVersion,
      required final String ledgerTimestamp,
      required final String oldestBlockHeight,
      required final String blockHeight,
      final String? gitHash}) = _$LedgerInfoRemoteModelImpl;
  const _LedgerInfoRemoteModel._() : super._();

  factory _LedgerInfoRemoteModel.fromJson(Map<String, dynamic> json) =
      _$LedgerInfoRemoteModelImpl.fromJson;

  @override
  int get chainId;
  @override
  String get epoch;
  @override
  String get ledgerVersion;
  @override
  String get oldestLedgerVersion;
  @override
  String get ledgerTimestamp; // required String nodeRole,
  @override
  String get oldestBlockHeight;
  @override
  String get blockHeight;
  @override
  String? get gitHash;

  /// Create a copy of LedgerInfoRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LedgerInfoRemoteModelImplCopyWith<_$LedgerInfoRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
