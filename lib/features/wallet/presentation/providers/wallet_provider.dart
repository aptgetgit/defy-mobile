import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/nft_model.dart';
import '../../data/models/token_model.dart';
import '../../data/token_data.dart';
import 'wallet_state.dart';

part 'generated/wallet_provider.g.dart';

@Riverpod(keepAlive: true)
class WalletNotifier extends _$WalletNotifier {
  @override
  WalletState build() {
    // Initialize with data from token_data.dart
    final List<Token> initialTokens = List.from(tokens);
    final List<NFTCollection> initialNFTCollections = _buildNFTCollections();
    
    return WalletState(
      allTokens: initialTokens,
      displayedTokens: initialTokens,
      allNFTCollections: initialNFTCollections,
      displayedNFTCollections: initialNFTCollections,
    );
  }

   void toggleSortDirection() {
    state = state.copyWith(
      isSortAscending: !state.isSortAscending,
    );
    
   
  }


  // Tab navigation
  void setCurrentTab(int index) {
    state = state.copyWith(
      currentTabIndex: index,
      isMoreButtonSelected: false,
    );
  }

  // More button actions
  void toggleMoreButton() {
    if (!state.isMoreButtonSelected) {
      // Entering More mode - restore selections for hidden items
      state = state.copyWith(
        isMoreButtonSelected: true,
        selectedTokens: state.hideSelected ? state.hiddenTokens : {},
        selectedNFTs: state.hideSelected ? state.hiddenNFTs : {},
        isBalanceHidden: !state.isMoreButtonSelected ? true : state.isBalanceHidden,
        isHidingActive: state.isMoreButtonSelected ? false : state.isHidingActive,
      );
    } else {
      // Exiting More mode
      state = state.copyWith(
        isMoreButtonSelected: false,
        selectedTokens: {},
        selectedNFTs: {},
        isBalanceHidden: false,
      );
    }
  }

  // Balance actions
  void setBalanceOption(String option) {
    state = state.copyWith(
      selectedBalanceOption: option,
    );
  }

  // Token selection actions
  void toggleTokenSelection(int tokenIndex) {
    final Set<int> updatedSelection = Set<int>.from(state.selectedTokens);
    
    if (updatedSelection.contains(tokenIndex)) {
      updatedSelection.remove(tokenIndex);
    } else {
      updatedSelection.add(tokenIndex);
    }
    
    state = state.copyWith(
      selectedTokens: updatedSelection,
    );
  }

  // NFT selection actions
  void toggleNFTSelection(int collectionIndex, int nftIndex) {
    final Map<int, Set<int>> updatedSelection = Map<int, Set<int>>.from(state.selectedNFTs);
    
    if (!updatedSelection.containsKey(collectionIndex)) {
      updatedSelection[collectionIndex] = <int>{};
    }
    
    if (updatedSelection[collectionIndex]!.contains(nftIndex)) {
      updatedSelection[collectionIndex]!.remove(nftIndex);
      
      // If no NFTs are selected in this collection, remove the collection entry
      if (updatedSelection[collectionIndex]!.isEmpty) {
        updatedSelection.remove(collectionIndex);
      }
    } else {
      updatedSelection[collectionIndex]!.add(nftIndex);
    }
    
    // Check if all NFTs in collection are selected
    final bool allSelected = updatedSelection.containsKey(collectionIndex) && 
        updatedSelection[collectionIndex]!.length == 
        state.allNFTCollections[collectionIndex].nfts.length;
    
    final Map<int, bool> updatedAllSelected = Map<int, bool>.from(state.allCollectionNFTsSelected);
    updatedAllSelected[collectionIndex] = allSelected;
    
    state = state.copyWith(
      selectedNFTs: updatedSelection,
      allCollectionNFTsSelected: updatedAllSelected,
    );
  }

  // Collection selection actions
  void toggleCollectionSelection(int collectionIndex) {
    final Map<int, bool> updatedAllSelected = Map<int, bool>.from(state.allCollectionNFTsSelected);
    final bool isCurrentlySelected = updatedAllSelected[collectionIndex] ?? false;
    updatedAllSelected[collectionIndex] = !isCurrentlySelected;
    
    final Map<int, Set<int>> updatedSelection = Map<int, Set<int>>.from(state.selectedNFTs);
    
    if (!isCurrentlySelected) {
      // Select all NFTs in the collection
      final Set<int> allNFTIndices = Set<int>.from(
        List<int>.generate(
          state.allNFTCollections[collectionIndex].nfts.length, 
          (int index) => index
        )
      );
      updatedSelection[collectionIndex] = allNFTIndices;
    } else {
      // Deselect all NFTs in the collection
      updatedSelection.remove(collectionIndex);
    }
    
    state = state.copyWith(
      selectedNFTs: updatedSelection,
      allCollectionNFTsSelected: updatedAllSelected,
    );
  }

  // Toggle NFT collection expand/collapse
  void toggleCollectionExpanded(int collectionIndex) {
    final Map<int, bool> updatedExpandedStates = Map<int, bool>.from(state.expandedStates);
    updatedExpandedStates[collectionIndex] = !(updatedExpandedStates[collectionIndex] ?? true);
    
    state = state.copyWith(
      expandedStates: updatedExpandedStates,
    );
  }

  // Hiding functionality
  void activateHiding() {
    state = state.copyWith(
      isHidingActive: true,
    );
  }

  // Apply hide/unhide
  void applyChanges() {
    // Store the current selections
    final Set<int> hiddenTokens = Set<int>.from(state.selectedTokens);
    final Map<int, Set<int>> hiddenNFTs = Map<int, Set<int>>.from(state.selectedNFTs);
    
    if (state.isHidingActive) {
      // Filter tokens
      final List<Token> updatedDisplayedTokens = state.allTokens
          .where((Token token) => !state.selectedTokens.contains(
              state.allTokens.indexOf(token)))
          .toList();
      
      // Filter NFT collections
      final List<NFTCollection> updatedDisplayedNFTCollections = [];
      for (int i = 0; i < state.allNFTCollections.length; i++) {
        if (!(state.allCollectionNFTsSelected[i] ?? false)) {
          updatedDisplayedNFTCollections.add(state.allNFTCollections[i]);
        }
      }
      
      state = state.copyWith(
        isMoreButtonSelected: false,
        displayedTokens: updatedDisplayedTokens,
        displayedNFTCollections: updatedDisplayedNFTCollections,
        hideSelected: true,
        isHidingActive: false,
        // Don't clear selections - we need to remember what's hidden
        hiddenTokens: hiddenTokens, // Store hidden tokens
        hiddenNFTs: hiddenNFTs,   // Store hidden NFTs
      );
    } else {
      // Just close more options panel without changing what's hidden
      state = state.copyWith(
        isMoreButtonSelected: false,
        // Keep track of what's hidden separately from what's selected
        selectedTokens: {},  // Clear current selections
        selectedNFTs: {},   // Clear current selections
      );
    }
  }

  // Sort functionality
  void showSortSheet() {
    state = state.copyWith(
      isSortSheetVisible: true,
    );
  }
  
  void hideSortSheet() {
    state = state.copyWith(
      isSortSheetVisible: false,
    );
  }

  // Replace these methods:

void toggleSortPrice() {
  state = state.copyWith(
    isSortPriceButtonSelected: true,
    isSortBalanceButtonSelected: false,
    isSortAlphabetButtonSelected: false,
    isSort24hrButtonSelected: false,
  );
  
  _sortTokensByPrice();
}

void toggleSortBalance() {
  state = state.copyWith(
    isSortPriceButtonSelected: false,
    isSortBalanceButtonSelected: true,
    isSortAlphabetButtonSelected: false,
    isSort24hrButtonSelected: false,
  );
  
  _sortTokensByBalance();
}

void toggleSortAlphabet() {
  state = state.copyWith(
    isSortPriceButtonSelected: false,
    isSortBalanceButtonSelected: false,
    isSortAlphabetButtonSelected: true,
    isSort24hrButtonSelected: false,
  );
  
  _sortTokensAlphabetically();
}

void toggleSort24hr() {
  state = state.copyWith(
    isSortPriceButtonSelected: false,
    isSortBalanceButtonSelected: false,
    isSortAlphabetButtonSelected: false,
    isSort24hrButtonSelected: true,
  );
  
  _sortTokensBy24hrChange();
}
  // Handler methods for BaseScreenWithNav
  void handleHidePressed() {
    activateHiding();
  }
  
  void handleSortPressed() {
    showSortSheet();
  }
  
  void handleWatchlistPressed() {
    // This should trigger the watchlist functionality
    // It would typically show the watchlist bottom sheet via a callback
    // Since we can't directly show the bottom sheet from here, we'll set a flag
    // that can be observed by the UI to show the sheet
    state = state.copyWith(
      isWatchlistActionTriggered: true,
    );
    
    // Reset the trigger flag after a short delay
    Future<void>.delayed(const Duration(milliseconds: 100), () {
      if (state.isWatchlistActionTriggered) {
        state = state.copyWith(
          isWatchlistActionTriggered: false,
        );
      }
    });
  }

  // Helper methods for sorting
  void _sortTokensByPrice() {
    final List<Token> sortedTokens = List<Token>.from(state.displayedTokens);
    
    // Sort based on the direction flag
    if (state.isSortAscending) {
      sortedTokens.sort((Token a, Token b) => _extractNumber(a.price).compareTo(_extractNumber(b.price)));
    } else {
      sortedTokens.sort((Token a, Token b) => _extractNumber(b.price).compareTo(_extractNumber(a.price)));
    }
        
    state = state.copyWith(
      displayedTokens: sortedTokens,
    );
  }
  
  void _sortTokensByBalance() {
    final List<Token> sortedTokens = List<Token>.from(state.displayedTokens);
    
    // Sort based on the direction flag
    if (state.isSortAscending) {
      sortedTokens.sort((Token a, Token b) => _extractNumber(a.balance as String).compareTo(_extractNumber(b.balance as String)));
    } else {
      sortedTokens.sort((Token a, Token b) => _extractNumber(b.balance as String).compareTo(_extractNumber(a.balance as String)));
    }
        
    state = state.copyWith(
      displayedTokens: sortedTokens,
    );
  }
  
  void _sortTokensAlphabetically() {
    final List<Token> sortedTokens = List<Token>.from(state.displayedTokens);
    
    // Sort based on the direction flag
    if (state.isSortAscending) {
      sortedTokens.sort((Token a, Token b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else {
      sortedTokens.sort((Token a, Token b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
    }
        
    state = state.copyWith(
      displayedTokens: sortedTokens,
    );
  }
  
  void _sortTokensBy24hrChange() {
    final List<Token> sortedTokens = List<Token>.from(state.displayedTokens);
    
    // Sort based on the direction flag
    if (state.isSortAscending) {
      sortedTokens.sort((Token a, Token b) => _extractPercentage(a.change).compareTo(_extractPercentage(b.change)));
    } else {
      sortedTokens.sort((Token a, Token b) => _extractPercentage(b.change).compareTo(_extractPercentage(a.change)));
    }
        
    state = state.copyWith(
      displayedTokens: sortedTokens,
    );
  }

  // Add to watchlist
  void addSelectedTokensToWatchlist() {
    final Set<int> updatedWatchlist = Set<int>.from(state.watchlistTokens)
      ..addAll(state.selectedTokens);
      
    state = state.copyWith(
      watchlistTokens: updatedWatchlist,
      selectedTokens: {},
    );
  }

  // QR Scanner toggle
  void toggleQrScanner() {
    state = state.copyWith(
      isQrScannerOpen: !state.isQrScannerOpen,
    );
  }

  void toggleBalanceVisibility(bool isHidden) {
    state = state.copyWith(
      isBalanceHidden: isHidden,
    );
  }

  // Helper method to update displayed items
  void _updateDisplayedItems() {
    final List<Token> newDisplayedTokens = [];
    
    for (int i = 0; i < state.allTokens.length; i++) {
      // Only add to displayed tokens if NOT (selected AND hideSelected)
      if (!(state.selectedTokens.contains(i) && state.hideSelected)) {
        newDisplayedTokens.add(state.allTokens[i]);
      }
    }
    
    // Similar logic for NFTs
    // ...

    state = state.copyWith(
      displayedTokens: newDisplayedTokens,
      // Update displayed NFTs too
    );
  }

  // Helper methods
  double _extractNumber(String text) {
    final String numericString = text.replaceAll(RegExp('[^0-9.]'), '');
    return double.tryParse(numericString) ?? 0.0;
  }
  
  double _extractPercentage(String text) {
    final String numericString = text.replaceAll(RegExp('[^0-9.-]'), '');
    return double.tryParse(numericString) ?? 0.0;
  }
  
  List<NFTCollection> _buildNFTCollections() => <NFTCollection>[
    NFTCollection(
      name: 'Chum Chums NFT',
      count: 2,
      nfts: <NFT>[
        NFT(
          id: '#4147', 
          price: '0.02', 
          imageUrl: 'assets/images/Mask group.png',
        ),
        NFT(
          id: '#4148', 
          price: '0.02', 
          imageUrl: 'assets/images/Mask group (1).png',
          type: NFTType.audio,
        ),
      ],
    ),
    NFTCollection(
      name: 'Chum Chums NFT',
      count: 2,
      nfts: <NFT>[
        NFT(
          id: '#4149', 
          price: '0.02', 
          imageUrl: 'assets/images/Mask group (2).png',
          type: NFTType.video,
        ),
        NFT(
          id: '#4150', 
          price: '0.02', 
          imageUrl: 'assets/images/Mask group (3).png',
        ),
      ],
    ),
  ];
}