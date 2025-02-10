// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_blockchain_account_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBlockchainAccountGroupImpl _$$UserBlockchainAccountGroupImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$UserBlockchainAccountGroupImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'name',
            'animated_icon_url',
            'background_color'
          ],
        );
        final val = _$UserBlockchainAccountGroupImpl(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          animatedIconUrl:
              $checkedConvert('animated_icon_url', (v) => v as String),
          backgroundColor:
              $checkedConvert('background_color', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'animatedIconUrl': 'animated_icon_url',
        'backgroundColor': 'background_color'
      },
    );

const _$$UserBlockchainAccountGroupImplFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'animatedIconUrl': 'animated_icon_url',
  'backgroundColor': 'background_color',
};

abstract final class _$$UserBlockchainAccountGroupImplJsonKeys {
  static const String id = 'id';
  static const String name = 'name';
  static const String animatedIconUrl = 'animated_icon_url';
  static const String backgroundColor = 'background_color';
}

// ignore: unused_element
abstract class _$$UserBlockchainAccountGroupImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? animatedIconUrl(String instance) => instance;
  // ignore: unused_element
  static Object? backgroundColor(String instance) => instance;
}
