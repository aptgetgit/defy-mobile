import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:defy/features/shared/presentation/providers/user_wallet_tokens_notifier_provider.dart';
import 'package:defy/features/transaction/send/domain/entities/send_profile_entity.dart';
import 'package:defy/features/transaction/send/domain/entities/send_token_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/send_tokens_provider.g.dart';

class SendAssets {
  final List<SendTokenEntity> tokens;
  final List<SendProfileEntity> receivers;
  final List<double> amount;
  SendAssets({
    required this.tokens,
    required this.receivers,
    required this.amount,
  });

  SendAssets copyWith({
    List<SendTokenEntity>? tokens,
    List<SendProfileEntity>? receivers,
    List<double>? amount,
  }) {
    return SendAssets(
      tokens: tokens ?? this.tokens,
      receivers: receivers ?? this.receivers,
      amount: amount ?? this.amount,
    );
  }
}

@Riverpod(keepAlive: true)
class SendTokens extends _$SendTokens {
  @override
  Future<List<SendTokenEntity>> build() async {
    final walletTokens = await ref.read(userWalletTokensProvider.future);

    if (walletTokens == null) {
      return [];
    }

    return _getSendWalletTokens(walletTokens);
  }

  List<SendTokenEntity> _getSendWalletTokens(
      List<UserWalletToken> walletTokens) {
    if (walletTokens.isEmpty) {
      return [];
    }
    final sendWalletTokens = walletTokens
        .map(
          (token) => SendTokenEntity(
              name: token.metaData?.name,
              symbol: token.metaData?.symbol,
              decimal: token.metaData?.decimals,
              amount: token.amount,
              assetType: token.assetType),
        )
        .toList();
    return sendWalletTokens;
  }

  void toggleSendTokens(SendTokenEntity token) {
    state = AsyncValue.data(state.value?.map((t) {
          if (t.assetType == token.assetType) {
            return t.copyWith(isSelected: !(t.isSelected));
          }
          return t;
        }).toList() ??
        []);
  }

  void reset() {
    state = AsyncValue.data(state.value?.map((t) {
          return t.copyWith(isSelected: false);
        }).toList() ??
        []);
  }
}

@Riverpod(keepAlive: true)
class SelectedSendTokens extends _$SelectedSendTokens {
  @override
  SendAssets build() {
    return SendAssets(
      tokens: [],
      receivers: [],
      amount: [],
    );
  }

  void addToken(SendTokenEntity token) {
    ref.read(sendTokensProvider.notifier).toggleSendTokens(token);
    state = state.copyWith(
      tokens: [...state.tokens, token],
    );
  }

  void removeToken(SendTokenEntity token) {
    ref.read(sendTokensProvider.notifier).toggleSendTokens(token);
    final currentTokens = state.tokens;
    final index = currentTokens
        .indexWhere((t) => t.assetType == token.assetType);
    if (index != -1) {
      state = state.copyWith(
        tokens: [...currentTokens]..removeAt(index),
      );
    }
  }

  void addReceiver(SendProfileEntity receiver) {
    state = state.copyWith(
      receivers: [...state.receivers, receiver],
    );
  }

  void saveAmount(List<double> amount) {
    state = state.copyWith(
      amount: amount,
    );
  }

  void reset() {
    ref.read(sendTokensProvider.notifier).reset();
    state = state.copyWith(
      tokens: [],
    );
  }
}

@Riverpod(keepAlive: true)
class SendRecentProfiles extends _$SendRecentProfiles {
  @override
  List<SendProfileEntity> build() {
        final recentTransactionProfiles = [
      SendProfileEntity(
        assetUrl: "assets/images/Black-Avatar.png",
        name: "Sunil",
        userName: "version0",
        walletAddress: "0x66a77185e5ad0c5687017797b8702ea001d5a3e8aa2da49577d4629bb23162b6",
      ),
      SendProfileEntity(
        assetUrl: "assets/images/Black-Avatar.png",
        name: "Anil",
        userName: "version0",
        walletAddress: "0xff",
      ),
      SendProfileEntity(
        assetUrl: "assets/images/Black-Avatar.png",
        name: "Anand",
        userName: "version0",
        walletAddress: "0xff",
      ),
      SendProfileEntity(
        assetUrl: "assets/images/Black-Avatar.png",
        name: "Nitish",
        userName: "version0",
        walletAddress: "0xff",
      ),
      SendProfileEntity(
        assetUrl: "assets/images/Black-Avatar.png",
        name: "Jeff",
        userName: "version0",
        walletAddress: "0xff",
      ),
      SendProfileEntity(
        assetUrl: "assets/images/Black-Avatar.png",
        name: "alan",
        userName: "version0",
        walletAddress: "0xff",
      ),
    ];
    return recentTransactionProfiles;
  }
}


