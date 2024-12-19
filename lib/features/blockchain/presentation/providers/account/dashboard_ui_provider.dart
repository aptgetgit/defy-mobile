import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/dashboard_ui_provider.g.dart';

@Riverpod(keepAlive: true)
class ActiveGroup extends _$ActiveGroup {
  @override
  String build() => 'Account 1';
  void setActiveAccount(String name) => state = name;
}

@Riverpod(keepAlive: true)
class WalletCreationTextController extends _$WalletCreationTextController {
  @override
  TextEditingController build() => TextEditingController();
}