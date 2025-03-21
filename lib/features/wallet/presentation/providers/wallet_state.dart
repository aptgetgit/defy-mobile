import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/nft_model.dart';
import '../../data/models/token_model.dart';


part 'generated/wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    // Balance information
    @Default('Total Balance') String selectedBalanceOption,
    @Default('1,038.56') String totalBalance,
    @Default(false) bool isBalanceHidden,
    
    // Token management
    @Default([]) List<Token> allTokens,
    @Default([]) List<Token> displayedTokens,
    @Default({}) Set<int> selectedTokens,
    @Default({}) Set<int> watchlistTokens,
    @Default(false) bool hideSelected,
    @Default(false) bool isWatchlistActionTriggered,
    
    // NFT management
    @Default([]) List<NFTCollection> allNFTCollections,
    @Default([]) List<NFTCollection> displayedNFTCollections,
    @Default({}) Map<int, Set<int>> selectedNFTs,
    @Default({}) Map<int, bool> expandedStates,
    @Default({}) Map<int, bool> allCollectionNFTsSelected,
    
    // UI state
    @Default(0) int currentTabIndex,
    @Default(false) bool isMoreButtonSelected,
    @Default(false) bool isHidingActive,
    @Default(false) bool isQrScannerOpen,
    
    // Sort options
    @Default(false) bool isSortSheetVisible,
    @Default(false) bool isSortPriceButtonSelected,
    @Default(false) bool isSortBalanceButtonSelected,
    @Default(false) bool isSortAlphabetButtonSelected,
    @Default(false) bool isSort24hrButtonSelected,
  }) = _WalletState;
}