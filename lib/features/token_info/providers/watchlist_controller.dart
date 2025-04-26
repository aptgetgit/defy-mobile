import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generated/watchlist_controller.g.dart';

class WatchlistState {

  WatchlistState({
    this.collectionType = '',
    TextEditingController? newTokenCollectionController,
    FocusNode? newTokenCollectionFocusNode,
  })  : newTokenCollectionController =
            newTokenCollectionController ?? TextEditingController(),
        newTokenCollectionFocusNode =
            newTokenCollectionFocusNode ?? FocusNode();
  final String collectionType;
  final TextEditingController newTokenCollectionController;
  final FocusNode newTokenCollectionFocusNode;

  WatchlistState copyWith({
    String? collectionType,
  }) => WatchlistState(
      collectionType: collectionType ?? this.collectionType,
    );
}

@Riverpod(keepAlive: true)
class WatchlistController extends _$WatchlistController {
  @override
  WatchlistState build() {
    ref.onDispose(() {
      state.newTokenCollectionController.dispose();
      state.newTokenCollectionFocusNode.dispose();
    });
    return WatchlistState();
  }

  void setCollectionType(String value) {
    state = state.copyWith(collectionType: value);
  }
}
