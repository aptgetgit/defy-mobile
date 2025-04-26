import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'watchlist_collection_model.dart';

part 'generated/watchlist_collection_provider.g.dart';
part 'generated/watchlist_collection_provider.freezed.dart';

@riverpod
class CreateCollection extends _$CreateCollection {
  @override
  CreateCollectionState build() => const CreateCollectionState();
  
  void setName(String name) {
    state = state.copyWith(name: name);
  }
  
  void setType(CollectionType type) {
    state = state.copyWith(type: type);
  }
  
  void toggleKeyboardVisibility(bool isVisible) {
    state = state.copyWith(isKeyboardOpen: isVisible);
  }
  
  void resetState() {
    state = const CreateCollectionState();
  }
}

@freezed
class CreateCollectionState with _$CreateCollectionState {
  const factory CreateCollectionState({
    @Default('') String name,
    @Default(CollectionType.nft) CollectionType type,
    @Default(false) bool isKeyboardOpen,
  }) = _CreateCollectionState;
  
  const CreateCollectionState._();
  
  bool get isValid => name.isNotEmpty;
}
