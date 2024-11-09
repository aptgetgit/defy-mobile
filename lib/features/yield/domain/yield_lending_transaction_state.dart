
import 'package:defy/features/yield/common/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YieldLendingTransactionState {
  final bool isSwapped;
  final String amount;
  final String amountOne;
  final String amount2;
  final String amountTwo;
  final TransactionType transactionType;
  final TextEditingController amountController;
  final TextEditingController toAddressController;

  YieldLendingTransactionState({
    required this.isSwapped,
    required this.amount,
    required this.amountOne,
    required this.amount2,
    required this.amountTwo,
    required this.transactionType,
    required this.amountController,
    required this.toAddressController,
  });

  YieldLendingTransactionState copyWith({
    bool? isSwapped,
    String? amount,
    String? amountOne,
    String? amount2,
    String? amountTwo,
    TransactionType? transactionType,
  }) {
    return YieldLendingTransactionState(
      isSwapped: isSwapped ?? this.isSwapped,
      amount: amount ?? this.amount,
      amountOne: amountOne ?? this.amountOne,
      amount2: amount2 ?? this.amount2,
      amountTwo: amountTwo ?? this.amountTwo,
      transactionType: transactionType ?? this.transactionType,
      amountController: amountController,
      toAddressController: toAddressController,
    );
  }
}
