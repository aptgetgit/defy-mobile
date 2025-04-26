import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/watchlist_collection_form_provider.g.dart';
part 'generated/watchlist_collection_form_provider.freezed.dart';

@riverpod
class CollectionForm extends _$CollectionForm {
  @override
  CollectionFormState build({String? existingName}) {
    return CollectionFormState(
      collectionName: existingName ?? '',
      isKeyboardOpen: false,
    );
  }
  
  void setCollectionName(String name) {
    state = state.copyWith(collectionName: name);
  }
  
  void setKeyboardStatus(bool isOpen) {
    state = state.copyWith(isKeyboardOpen: isOpen);
  }
  
  void clear() {
    state = state.copyWith(collectionName: '');
  }
}

@freezed
class CollectionFormState with _$CollectionFormState {
  const factory CollectionFormState({
    required String collectionName,
    required bool isKeyboardOpen,
  }) = _CollectionFormState;
  
  const CollectionFormState._();
  
  bool get isValid => collectionName.isNotEmpty;
}
