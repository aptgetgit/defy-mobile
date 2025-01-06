import 'package:defy/features/yield/common/utils/enum.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/data/source/remote/pool_client.dart';
import 'package:defy/features/yield/domain/yield_lending_transaction_state.dart';
import 'package:defy/features/yield/domain/yield_state_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/yield_lending_transaction_view_provider.g.dart';

@Riverpod(keepAlive: true)
class YieldLendingTransaction extends _$YieldLendingTransaction {
  @override
  YieldLendingTransactionState build() {
    return YieldLendingTransactionState(
      isSwapped: false,
      amount: '\$0',
      amountOne: '\$0',
      amount2: '0',
      amountTwo: '0',
      transactionType: TransactionType.send,
      amountController: TextEditingController(),
      toAddressController: TextEditingController(),
    );
  }

  void swap() {
    state = state.copyWith(isSwapped: !state.isSwapped);
  }

  void onTapOne(String label) {
    HapticFeedback.lightImpact();
    if (label == 'cancel') {
      state = state.copyWith(
        amount: _removeLastCharacter(state.amount),
        amountOne: _removeLastCharacter(state.amountOne),
      );
    } else {
      if (state.amount.length < 12) {
        state = state.copyWith(
          amount: state.amount == '\$0' ? '\$' + label : state.amount + label,
          amountOne: state.amountOne == '\$0' ? '\$' + label : state.amountOne + label,
        );
      }
    }
  }

  void onTapTwo(String label) {
    HapticFeedback.lightImpact();
    if (label == 'cancel') {
      state = state.copyWith(
        amount2: _removeLastCharacter(state.amount2),
        amountTwo: _removeLastCharacter(state.amountTwo),
      );
    } else {
      if (state.amount2.length < 12) {
        state = state.copyWith(
          amount2: state.amount2 == '0' ? label : state.amount2 + label,
          amountTwo: state.amountTwo == '0' ? label : state.amountTwo + label,
        );
      }
    }
  }

  void continueToLoading(BuildContext context) {
    // TransactionLoadingScreenRoute(state.transactionType).push(context);
  }

  String _removeLastCharacter(String str) {
    return str.length > 2 && str != '\$0' ? str.substring(0, str.length - 1) : '\$0';
  }
}