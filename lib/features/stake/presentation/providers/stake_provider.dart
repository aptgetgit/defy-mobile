import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'stake_state.dart';

part 'generated/stake_provider.g.dart';

@riverpod
class StakeNotifier extends _$StakeNotifier {
  @override
  StakeState build() {
    return const StakeState();
  }
  
  // Provider selection
  void selectProvider({
    required String name,
    required String logoPath,
    required String apy,
    required String investors,
    bool isDelegate = false,
  }) {
    state = state.copyWith(
      providerName: name,
      providerLogoPath: logoPath,
      apy: apy,
      investors: investors,
      isDelegate: isDelegate,
    );
  }
  
  // UI state management
  void setSearchIconVisibility(bool isVisible) {
    state = state.copyWith(isSearchIconVisible: isVisible);
  }
  
  void setCurrentTab(int index) {
    state = state.copyWith(currentTabIndex: index);
  }
  
  void setCalculatorTab(int index) {
    state = state.copyWith(calculatorTab: index);
  }
  
  // Amount handling
  void setStakeAmount(String amount) {
    state = state.copyWith(stakeAmount: amount);
    
    // Convert to APT (simplified example - replace with actual conversion logic)
    final double numericAmount = double.tryParse(amount) ?? 0;
    final double aptAmount = numericAmount / 50; // Example rate: $50 per APT
    state = state.copyWith(stakeAmountInAPT: aptAmount.toStringAsFixed(2));
  }
  
  void clearAmount() {
    state = state.copyWith(stakeAmount: '0', stakeAmountInAPT: '0');
  }
  
  void handleKeypadInput(String input) {
    if (input == 'cancel') {
      // Remove the last character
      if (state.stakeAmount.length > 1) {
        state = state.copyWith(stakeAmount: state.stakeAmount.substring(0, state.stakeAmount.length - 1));
      } else {
        state = state.copyWith(stakeAmount: '0');
      }
    } else if (input == '.') {
      // Add decimal point if not already present
      if (!state.stakeAmount.contains('.')) {
        state = state.copyWith(stakeAmount: state.stakeAmount + '.');
      }
    } else {
      // Add digit
      if (state.stakeAmount == '0') {
        state = state.copyWith(stakeAmount: input);
      } else {
        state = state.copyWith(stakeAmount: state.stakeAmount + input);
      }
    }
    
    // Update APT amount
    final double numericAmount = double.tryParse(state.stakeAmount) ?? 0;
    final double aptAmount = numericAmount / 50; // Example rate: $50 per APT
    state = state.copyWith(stakeAmountInAPT: aptAmount.toStringAsFixed(2));
  }
  
  // Calculator settings
  void setInvestmentAmount(double amount) {
    state = state.copyWith(investmentAmount: amount);
  }
  
  void setTimePeriod(String period) {
    state = state.copyWith(selectedTimePeriod: period);
  }
  
  // Search and filter
  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }
  
  void setFilterIndex(int index) {
    state = state.copyWith(filterIndex: index);
  }
  
  // Use max amount (from wallet)
  void useMaxAmount() {
    // Replace with actual max amount from wallet
    const double maxAmount = 5000;
    setStakeAmount(maxAmount.toString());
  }
  
  // Calculate returns based on APY and period
  double calculateReturns() {
    // Extract the APY percentage (remove '%' and convert to double)
    final String apyString = state.apy.replaceAll('%', '').trim();
    final double apyPercentage = double.tryParse(apyString) ?? 0;
    
    // Convert to decimal (e.g., 100% -> 1.0)
    final double apyDecimal = apyPercentage / 100;
    
    // Get the investment amount
    final double investment = double.tryParse(state.stakeAmount) ?? 0;
    
    // Calculate returns based on time period
    double timeFactor = 0;
    switch (state.selectedTimePeriod) {
      case '1M':
        timeFactor = 1/12;
      case '3M':
        timeFactor = 3/12;
      case '6M':
        timeFactor = 6/12;
      case '1Y':
        timeFactor = 1;
      default:
        timeFactor = 1;
    }
    
    // Simple interest calculation (for illustration)
    final double returns = investment * (1 + (apyDecimal * timeFactor));
    return returns;
  }
}
