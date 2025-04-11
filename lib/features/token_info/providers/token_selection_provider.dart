import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../wallet/data/models/token_model.dart';
import '../../wallet/data/token_data.dart';

part 'generated/token_selection_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedTokenNotifier extends _$SelectedTokenNotifier {
  @override
  Token? build() {
    // Initialize with no selected token
    return null;
  }
  
  void selectToken(String tokenId) {
    // Find the token by ID in your token data
    final Token token = tokens.firstWhere(
      (Token token) => token.name.toLowerCase() == tokenId.toLowerCase(),
      orElse: () => tokens.first, // Default to first token if not found
    );
    
    state = token;
  }
  
  void selectTokenByIndex(int index) {
    if (index >= 0 && index < tokens.length) {
      state = tokens[index];
    }
  }
  
  void clearSelection() {
    state = null;
  }
}
