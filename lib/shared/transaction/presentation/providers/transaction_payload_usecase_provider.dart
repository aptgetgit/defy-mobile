import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/transaction_payload_repository_implementation.dart';
import '../../domain/repositories/transaction_payload_repository.dart';
import '../../domain/usecases/create_coin_transfer_payload_usecase.dart';

part 'generated/transaction_payload_usecase_provider.g.dart';

@riverpod
ITransactionPayloadRepository transactionPayloadRepository(
  Ref ref,
) =>
    TransactionPayloadRepository();

@riverpod
CreateCoinTransferPayloadUseCase createCoinTransferPayloadUseCase(
  Ref ref,
) =>
    CreateCoinTransferPayloadUseCase(
      repository: ref.read(transactionPayloadRepositoryProvider),
    );
