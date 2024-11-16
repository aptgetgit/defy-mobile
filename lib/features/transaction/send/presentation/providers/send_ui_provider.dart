import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/send_ui_provider.g.dart';

class SendScreenState {
  final bool seeMore;
  final TextEditingController searchController ;

  SendScreenState({
    required this.seeMore,
    required this.searchController,
  });

  SendScreenState copyWith({
    bool? seeMore,
    TextEditingController? searchController,
  }) { 
    return SendScreenState(
      seeMore: seeMore ?? this.seeMore,
      searchController: searchController ?? this.searchController,
    );
  }
}

@Riverpod(keepAlive: true)
class SendScreen extends _$SendScreen {
  @override
  SendScreenState build() {
    return SendScreenState(
      seeMore: false,
      searchController: TextEditingController(),
    );
  }

  void toggleSeeMore() {
    state = state.copyWith(seeMore: !state.seeMore);
  }

  Future<void> pasteFromClipboard() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      state.searchController.text = clipboardData.text!;
      Fluttertoast.showToast(msg: 'Data pasted from clipboard');
    }
    if (clipboardData == null) {
      Fluttertoast.showToast(msg: 'No data found in clipboard');
    }
  }
}