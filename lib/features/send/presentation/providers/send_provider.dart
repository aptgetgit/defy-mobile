import 'dart:convert';

import 'package:defy/features/send/domain/models/send_asset_selection_screen_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:defy/features/send/domain/models/selectable_item_model.dart';

part 'generated/send_provider.g.dart';
part 'package:defy/features/send/domain/models/contact_model.dart';
part 'package:defy/features/send/domain/models/friends_model.dart';
part 'package:defy/features/send/domain/models/send_state_model.dart';
part 'package:defy/features/send/domain/models/wallet_model.dart';

@Riverpod(keepAlive: true)
class SendScreenProvider extends _$SendScreenProvider {
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

@Riverpod(keepAlive: true)
class SendAssetSelectionScreen extends _$SendAssetSelectionScreen {
  @override
  SendAssetSelectionScreenState build() {
    return SendAssetSelectionScreenState(
      isMulti: false,
      selectedAssetItems: [],
      isSelectionMode: false,
      tileSelected: [],
    );
  }

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedAssetItems: [],
    );
  }

  void selectTile(int index, SelectableItem item) {
    if (index < 0 || index >= state.tileSelected.length) {
      return; // Invalid index, exit early
    }

    final newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final newSelectedItems =
        List<SelectableItem>.from(state.selectedAssetItems);
    if (newSelected[index]) {
      newSelectedItems.add(item);
    } else {
      newSelectedItems.remove(item);
    }

    state = state.copyWith(
      tileSelected: newSelected,
      selectedAssetItems: newSelectedItems,
    );
  }

  void resetSelection() {
    state = state.copyWith(
      isSelectionMode: false,
      tileSelected: List.filled(state.tileSelected.length, false),
      selectedAssetItems: [],
    );
  }
}

@Riverpod(keepAlive: true)
class SendToFriend extends _$SendToFriend {
  @override
  SendToState<Friend> build() {
    return SendToState<Friend>(
      isSelectionMode: false,
      tileSelected: [],
      selectedToItems: [],
    );
  }

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedItems: [],
    );
  }

  void selectTile(int index, Friend item) {
    final newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final newSelectedItems = List<Friend>.from(state.selectedToItems);
    if (newSelected[index]) {
      newSelectedItems.add(item);
    } else {
      newSelectedItems.remove(item);
    }

    state = state.copyWith(
      tileSelected: newSelected,
      selectedItems: newSelectedItems,
    );
  }

  void resetSelection() {
    state = state.copyWith(
      isSelectionMode: false,
      tileSelected: List.filled(state.tileSelected.length, false),
      selectedItems: [],
    );
  }
}

@Riverpod(keepAlive: true)
class SendToWallet extends _$SendToWallet {
  @override
  SendToState<Wallet> build() {
    return SendToState<Wallet>(
      isSelectionMode: false,
      tileSelected: [],
      selectedToItems: [],
    );
  }

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedItems: [],
    );
  }

  void selectTile(int index, Wallet item) {
    final newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final newSelectedItems = List<Wallet>.from(state.selectedToItems);
    if (newSelected[index]) {
      newSelectedItems.add(item);
    } else {
      newSelectedItems.remove(item);
    }

    state = state.copyWith(
      tileSelected: newSelected,
      selectedItems: newSelectedItems,
    );
  }

  void resetSelection() {
    state = state.copyWith(
      isSelectionMode: false,
      tileSelected: List.filled(state.tileSelected.length, false),
      selectedItems: [],
    );
  }
}

@Riverpod(keepAlive: true)
class SendToContact extends _$SendToContact {
  @override
  SendToState<Contact> build() {
    return SendToState<Contact>(
      isSelectionMode: false,
      tileSelected: [],
      selectedToItems: [],
    );
  }

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedItems: [],
    );
  }

  void selectTile(int index, Contact item) {
    final newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final newSelectedItems = List<Contact>.from(state.selectedToItems);
    if (newSelected[index]) {
      newSelectedItems.add(item);
    } else {
      newSelectedItems.remove(item);
    }

    state = state.copyWith(
      tileSelected: newSelected,
      selectedItems: newSelectedItems,
    );
  }

  void resetSelection() {
    state = state.copyWith(
      isSelectionMode: false,
      tileSelected: List.filled(state.tileSelected.length, false),
      selectedItems: [],
    );
  }
}
