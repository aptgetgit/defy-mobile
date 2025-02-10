import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/nft_model.dart';
import '../../domain/models/selectable_item_model.dart';
import '../state/send_asset_selection_screen_state_model.dart';

part 'generated/send_provider.g.dart';
part 'package:defy/features/send/domain/models/contact_model.dart';
part 'package:defy/features/send/domain/models/friends_model.dart';
part 'package:defy/features/send/domain/models/wallet_model.dart';
part 'package:defy/features/send/presentation/state/send_state_model.dart';

@Riverpod(keepAlive: true)
class SendScreenProvider extends _$SendScreenProvider {
  @override
  SendScreenState build() => SendScreenState(
        seeMore: false,
        searchController: TextEditingController(),
      );

  void toggleSeeMore() {
    state = state.copyWith(seeMore: !state.seeMore);
  }

  Future<void> pasteFromClipboard() async {
    final ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      state.searchController.text = clipboardData.text!;
      await Fluttertoast.showToast(msg: 'Data pasted from clipboard');
    }
    if (clipboardData == null) {
      await Fluttertoast.showToast(msg: 'No data found in clipboard');
    }
  }
}

@Riverpod(keepAlive: true)
class SendNFTScreenProvider extends _$SendNFTScreenProvider {
  @override
  SendNFTState<NFT> build() => SendNFTState<NFT>(
        isSelectionMode: false,
        tileSelected: <bool>[],
        selectedNFTs: <NFT>[],
        searchController: TextEditingController(),
        seeMore: false,
      );

  void toggleSelectionMode() {
    state = state.copyWith(isSelectionMode: !state.isSelectionMode);
  }

  void toggleNFTSelection(NFT nft) {
    final List<NFT> updatedSelectedNFTs = List.from(state.selectedNFTs);
    if (updatedSelectedNFTs.contains(nft)) {
      updatedSelectedNFTs.remove(nft);
    } else {
      updatedSelectedNFTs.add(nft);
    }

    state = state.copyWith(
      selectedNFTs: updatedSelectedNFTs,
    );
  }

  void toggleAllNFTsInCollection(List<NFT> nfts) {
    final List<NFT> updatedSelectedNFTs = List.from(state.selectedNFTs);
    final bool allSelected =
        nfts.every((nft) => updatedSelectedNFTs.contains(nft));

    if (allSelected) {
      updatedSelectedNFTs.removeWhere((nft) => nfts.contains(nft));
    } else {
      for (final nft in nfts) {
        if (!updatedSelectedNFTs.contains(nft)) {
          updatedSelectedNFTs.add(nft);
        }
      }
    }

    state = state.copyWith(
      selectedNFTs: updatedSelectedNFTs,
    );
  }

  // void toggleAllNFTsInCollection(List<NFT> collectionNFTs) {
  //   final List<NFT> updatedSelectedNFTs = List.from(state.selectedNFTs);
  //   final List<bool> updatedTileSelected = List.from(state.tileSelected);

  //   bool allSelected = collectionNFTs.every((nft) => updatedSelectedNFTs.contains(nft));

  //   if (allSelected) {
  //     // If all NFTs in the collection are selected, unselect them all
  //     updatedSelectedNFTs.removeWhere((nft) => collectionNFTs.contains(nft));
  //     for (var nft in collectionNFTs) {
  //       int index = state.selectedNFTs.indexOf(nft);
  //       if (index != -1) {
  //         updatedTileSelected[index] = false;
  //       }
  //     }
  //   } else {
  //     // If not all NFTs are selected, select all NFTs in the collection
  //     for (var nft in collectionNFTs) {
  //       if (!updatedSelectedNFTs.contains(nft)) {
  //         updatedSelectedNFTs.add(nft);
  //         int index = state.selectedNFTs.indexOf(nft);
  //         if (index != -1) {
  //           updatedTileSelected[index] = true;
  //         }
  //       }
  //     }
  //   }

  //   state = state.copyWith(
  //     selectedNFTs: updatedSelectedNFTs,
  //     tileSelected: updatedTileSelected,
  //   );
  // }

  void clearSelection() {
    state = state.copyWith(
      tileSelected: List<bool>.filled(state.tileSelected.length, false),
      selectedNFTs: <NFT>[],
    );
  }

  void toggleSeeMore() {
    state = state.copyWith(seeMore: !state.seeMore);
  }

  Future<void> pasteFromClipboard() async {
    final ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      state.searchController.text = clipboardData.text!;
      await Fluttertoast.showToast(msg: 'Data pasted from clipboard');
    } else {
      await Fluttertoast.showToast(msg: 'No data found in clipboard');
    }
  }

  void setSearchQuery(String query) {
    state.searchController.text = query;
  }
}

@Riverpod(keepAlive: true)
class SendAssetSelectionScreen extends _$SendAssetSelectionScreen {
  @override
  SendAssetSelectionScreenState build() => SendAssetSelectionScreenState(
        isMulti: false,
        selectedAssetItems: <SelectableItem>[],
        isSelectionMode: false,
        tileSelected: <bool>[],
      );

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedAssetItems: <SelectableItem>[],
    );
  }

  void selectTile(int index, SelectableItem item) {
    if (index < 0 || index >= state.tileSelected.length) {
      return; // Invalid index, exit early
    }

    final List<bool> newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final List<SelectableItem> newSelectedItems =
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
      tileSelected: List<bool>.filled(state.tileSelected.length, false),
      selectedAssetItems: <SelectableItem>[],
    );
  }
}

@Riverpod(keepAlive: true)
class SendToFriend extends _$SendToFriend {
  @override
  SendToState<Friend> build() => SendToState<Friend>(
        isSelectionMode: false,
        tileSelected: <bool>[],
        selectedToItems: <Friend>[],
      );

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedItems: <Friend>[],
    );
  }

  void selectTile(int index, Friend item) {
    final List<bool> newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final List<Friend> newSelectedItems =
        List<Friend>.from(state.selectedToItems);
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
      selectedItems: <Friend>[],
    );
  }
}

@Riverpod(keepAlive: true)
class SendToWallet extends _$SendToWallet {
  @override
  SendToState<Wallet> build() => SendToState<Wallet>(
        isSelectionMode: false,
        tileSelected: <bool>[],
        selectedToItems: <Wallet>[],
      );

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedItems: <Wallet>[],
    );
  }

  void selectTile(int index, Wallet item) {
    final List<bool> newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final List<Wallet> newSelectedItems =
        List<Wallet>.from(state.selectedToItems);
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
      tileSelected: List<bool>.filled(state.tileSelected.length, false),
      selectedItems: <Wallet>[],
    );
  }
}

@Riverpod(keepAlive: true)
class SendToContact extends _$SendToContact {
  @override
  SendToState<Contact> build() => SendToState<Contact>(
        isSelectionMode: false,
        tileSelected: <bool>[],
        selectedToItems: <Contact>[],
      );

  void toggleSelectionMode(int length) {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      tileSelected: List.filled(length, false),
      selectedItems: <Contact>[],
    );
  }

  void selectTile(int index, Contact item) {
    final List<bool> newSelected = List<bool>.from(state.tileSelected);
    newSelected[index] = !newSelected[index];

    final List<Contact> newSelectedItems =
        List<Contact>.from(state.selectedToItems);
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
      tileSelected: List<bool>.filled(state.tileSelected.length, false),
      selectedItems: <Contact>[],
    );
  }
}
