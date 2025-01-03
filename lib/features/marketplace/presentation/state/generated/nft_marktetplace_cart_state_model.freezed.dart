// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../nft_marktetplace_cart_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NFTMarktetplaceCartStateModel {
  List<NFTMarketplaceCartEntity> get items =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NFTMarktetplaceCartStateModelCopyWith<NFTMarktetplaceCartStateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTMarktetplaceCartStateModelCopyWith<$Res> {
  factory $NFTMarktetplaceCartStateModelCopyWith(
          NFTMarktetplaceCartStateModel value,
          $Res Function(NFTMarktetplaceCartStateModel) then) =
      _$NFTMarktetplaceCartStateModelCopyWithImpl<$Res,
          NFTMarktetplaceCartStateModel>;
  @useResult
  $Res call({List<NFTMarketplaceCartEntity> items});
}

/// @nodoc
class _$NFTMarktetplaceCartStateModelCopyWithImpl<$Res,
        $Val extends NFTMarktetplaceCartStateModel>
    implements $NFTMarktetplaceCartStateModelCopyWith<$Res> {
  _$NFTMarktetplaceCartStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NFTMarketplaceCartEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTMarktetplaceCartStateModelImplCopyWith<$Res>
    implements $NFTMarktetplaceCartStateModelCopyWith<$Res> {
  factory _$$NFTMarktetplaceCartStateModelImplCopyWith(
          _$NFTMarktetplaceCartStateModelImpl value,
          $Res Function(_$NFTMarktetplaceCartStateModelImpl) then) =
      __$$NFTMarktetplaceCartStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NFTMarketplaceCartEntity> items});
}

/// @nodoc
class __$$NFTMarktetplaceCartStateModelImplCopyWithImpl<$Res>
    extends _$NFTMarktetplaceCartStateModelCopyWithImpl<$Res,
        _$NFTMarktetplaceCartStateModelImpl>
    implements _$$NFTMarktetplaceCartStateModelImplCopyWith<$Res> {
  __$$NFTMarktetplaceCartStateModelImplCopyWithImpl(
      _$NFTMarktetplaceCartStateModelImpl _value,
      $Res Function(_$NFTMarktetplaceCartStateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$NFTMarktetplaceCartStateModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NFTMarketplaceCartEntity>,
    ));
  }
}

/// @nodoc

class _$NFTMarktetplaceCartStateModelImpl
    implements _NFTMarktetplaceCartStateModel {
  const _$NFTMarktetplaceCartStateModelImpl(
      {final List<NFTMarketplaceCartEntity> items = const []})
      : _items = items;

  final List<NFTMarketplaceCartEntity> _items;
  @override
  @JsonKey()
  List<NFTMarketplaceCartEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'NFTMarktetplaceCartStateModel(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTMarktetplaceCartStateModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTMarktetplaceCartStateModelImplCopyWith<
          _$NFTMarktetplaceCartStateModelImpl>
      get copyWith => __$$NFTMarktetplaceCartStateModelImplCopyWithImpl<
          _$NFTMarktetplaceCartStateModelImpl>(this, _$identity);
}

abstract class _NFTMarktetplaceCartStateModel
    implements NFTMarktetplaceCartStateModel {
  const factory _NFTMarktetplaceCartStateModel(
          {final List<NFTMarketplaceCartEntity> items}) =
      _$NFTMarktetplaceCartStateModelImpl;

  @override
  List<NFTMarketplaceCartEntity> get items;
  @override
  @JsonKey(ignore: true)
  _$$NFTMarktetplaceCartStateModelImplCopyWith<
          _$NFTMarktetplaceCartStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
