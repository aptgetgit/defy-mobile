// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:defy/features/blockchain/presentation/providers/states/card_color.dart';
import 'package:defy/features/blockchain/presentation/providers/states/creation_stage_controller.dart';
import 'package:defy/features/blockchain/presentation/providers/states/new_wallet_data.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/new_wallet_data_provider.g.dart';

@Riverpod(keepAlive: true)
class ShowBalance extends _$ShowBalance {
  @override
  bool build() => true;
  void toggle() => state = !state;
}

@Riverpod()
class CardEmoji extends _$CardEmoji {
  @override
  Widget build() {
    return Icon(PhosphorIcons.user());
  }

  Widget setNewIcon(AnimatedEmoji? emoji) {
    if (emoji == null) {
      state = Icon(PhosphorIcons.user());
    } else {
      state = CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: emoji.getEmoji,
      );
      ref.read(newWalletDataStateProvider.notifier).setImageUrl(emoji.getEmoji);
    }
    return state;
  }

  Widget setImageUrl(String? url) {
    if (url == null) {
      state = Icon(PhosphorIcons.user());
    } else {
      state = CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: url,
      );
    }
    return state;
  }
}

@riverpod
class WalletCreationStage extends _$WalletCreationStage {
  @override
  CreationStageController build() {
    ref.onDispose(() {
      state.controller.dispose();
    });
    return CreationStageController(
      controller: PageController(initialPage: 0),
      stage: CreationStage.stageOne,
    );
  }

  Future<void> jumpToStage(CreationStage stage) async {
    // await state.controller.animateToPage(
    //   stage.index,
    //   duration: 100.milliseconds,
    //   curve: Curves.linear,
    // );
    state.controller.jumpToPage(stage.index);
    state = state.copyWith(stage: stage);
  }
}

@Riverpod(keepAlive: true)
class NewWalletDataState extends _$NewWalletDataState {
  @override
  NewWalletData build() {
    ref.onAddListener(() {});
    return NewWalletData(
      personaName: '',
      shareId: '',
      name: '',
      balance: '----------',
      cardColor: CardColor(index: 1, color: Colors.blue),
      iconUrl: AnimatedEmoji.Alien.getEmoji,
    );
  }

  reset() {
    state = NewWalletData(
      personaName: '',
      shareId: '',
      name: '',
      balance: '----------',
      cardColor: CardColor(index: 1, color: Colors.blue),
    );
  }

  setName(String name) {
    state = state.copyWith(name: name);
  }

  setBalance(String balance) {
    state = state.copyWith(balance: balance);
  }

  setCardColor(CardColor cardColor) {
    state = state.copyWith(cardColor: cardColor);
  }

  setShareId(String shareId) {
    state = state.copyWith(shareId: shareId);
  }

  setPersonaName(String personaName) {
    state = state.copyWith(personaName: personaName);
  }

  setType(NewWalletCreationType type) {
    state = state.copyWith(type: type);
  }

  setImageUrl(String? imageUrl) {
    state = state.copyWith(iconUrl: imageUrl);
  }

  // Future<void> createWallet() async {
  //   if (state.type == NewWalletCreationType.seed) {
  //     await _createWalletFromSeed();
  //   } else {
  //     await _createWalletFromPrivateKey();
  //   }
  // }

  // Future<bool> _createWalletFromSeed() async {
  //   try {
  //     String seedId = state.shareId;
  //     final seed = await const FlutterSecureStorage().read(key: seedId);
  //     logger.d("seed: $seed");
  //     if (seed == null) {
  //       logger.e("Empty seed");
  //       return false;
  //     }
  //     int seedIndex = 0;
  //     final keypairs = await ref.read(getAllRemoteKeypairProvider).call();
  //     keypairs.fold(
  //       (l) {},
  //       (data) {
  //         for (var keypair in data) {
  //           for (var item in keypair.strategy) {
  //             if (item.strategyType == 'seed' && item.shareId == seedId) {
  //               seedIndex = max(seedIndex, item.seedIndex ?? 0);
  //             }
  //           }
  //         }
  //       },
  //     );
  //     seedIndex++;
  //     final List<BlockchainId> blockchainIds = [
  //       // Eip155BlockchainId(Eip155Reference.ethereumMainnet),
  //       // SolanaBlockchainId(SolanaReference.solanaMainnet),
  //       // Bip122BlockchainId(Bip122Reference.bitcoinMainnet),
  //       AptosBlockchainId(AptosReference.aptosMainnet),
  //     ];

  //     final mnemonic = Mnemonic.fromString(seed);

  //     for (var blockchainId in blockchainIds) {
  //       final SeedKeyPairStrategyFactory seedStrategyFactory =
  //           SeedKeyPairStrategyProducer.getFactory(blockchainId.reference);
  //       final KeyPairFactory keyPairFactory =
  //           KeyPairFactoryProducer.getFactory(blockchainId.reference);
  //       final KeyPairBlockchainAccountStrategyFactory
  //           keyPairBlockchainAccountStrategyFactory =
  //           KeyPairBlockchainAccountStrategyProducer.getFactory(
  //               blockchainId.reference);
  //       final BlockchainAccountFactory accountFactory =
  //           BlockchainAccountFactoryProducer.getFactory(blockchainId.reference);

  //       SeedKeyPairStrategy aliceSeedStrategy = seedStrategyFactory
  //           .createFromSeedAndIndex(mnemonic.toSeed, seedIndex);
  //       keyPairFactory.generator = aliceSeedStrategy;
  //       final aliceKeyPair = await keyPairFactory.generate();
  //       aliceKeyPair.signer = aliceSeedStrategy;
  //       aliceKeyPair.verifier = aliceSeedStrategy;

  //       // Alice Account
  //       final aliceKeyPairStrategy = keyPairBlockchainAccountStrategyFactory
  //           .createFromKeyPair(aliceKeyPair);
  //       accountFactory.generator = aliceKeyPairStrategy;
  //       final aliceAccount = await accountFactory.generate();
  //       aliceAccount.signer = aliceKeyPairStrategy;
  //       aliceAccount.verifier = aliceKeyPairStrategy;

  //       await ref.read(postRemoteKeypairProvider).call([
  //         Keypair(
  //           id: 'id',
  //           namespace: 'aptos',
  //           reference: '1',
  //           publicKey: aliceKeyPair.publicKey,
  //           strategy: ['signer', 'verifier', 'generator']
  //               .map((purpose) => Strategy(
  //                   strategyType: 'seed',
  //                   shareId: seedId,
  //                   strategyPurpose: purpose,
  //                   seedIndex: seedIndex))
  //               .toList(),
  //         ),
  //       ]);

  //       await ref.read(createRemoteAccountProvider).call([
  //         Account(
  //           namespace: 'aptos',
  //           reference: '1',
  //           accountAddress: aliceAccount.blockchainAccountId.address,
  //           strategy: ['signer', 'verifier', 'generator']
  //               .map((purpose) => Strategy(
  //                   strategyType: 'keypair',
  //                   shareId: '',
  //                   strategyPurpose: purpose,
  //                   keypairId: 'aptos:1:${aliceKeyPair.publicKey}'))
  //               .toList(),
  //         ),
  //       ]);

  //       await ref.read(createGroupUseCaseProvider).call(
  //             state.personaName,
  //             Group(
  //               groupName: state.name,
  //               animatedIconUrl: state.iconUrl ?? 'http://www.google.com',
  //               backgroundHexColor:
  //                   colorToHex(state.cardColor.color, includeHashSign: true),
  //               isPrimary: false,
  //               blockchainAccounts: [
  //                 entity.BlockchainAccount(
  //                   namespace: 'aptos',
  //                   reference: '1',
  //                   accountAddress: aliceAccount.blockchainAccountId.address,
  //                 )
  //               ],
  //             ),
  //           );
  //     }
  //   } catch (e) {
  //     logger.e(e);
  //   }
  //   return true;
  // }

  // Future<bool> _createWalletFromPrivateKey() async {
  //   final privateKey =
  //       await const FlutterSecureStorage().read(key: state.shareId);
  //   if (privateKey == null) return false;
  //   try {
  //     final List<BlockchainId> blockchainIds = [
  //       // Eip155BlockchainId(Eip155Reference.ethereumMainnet),
  //       // SolanaBlockchainId(SolanaReference.solanaMainnet),
  //       // Bip122BlockchainId(Bip122Reference.bitcoinMainnet),
  //       AptosBlockchainId(AptosReference.aptosMainnet),
  //     ];

  //     for (var blockchainId in blockchainIds) {
  //       final PrivateKeyPairStrategyFactory privateKeyStrategyFactory =
  //           PrivateKeyPairStrategyProducer.getFactory(blockchainId.reference);
  //       final KeyPairFactory keyPairFactory =
  //           KeyPairFactoryProducer.getFactory(blockchainId.reference);
  //       final KeyPairBlockchainAccountStrategyFactory
  //           keyPairBlockchainAccountStrategyFactory =
  //           KeyPairBlockchainAccountStrategyProducer.getFactory(
  //               blockchainId.reference);
  //       final BlockchainAccountFactory accountFactory =
  //           BlockchainAccountFactoryProducer.getFactory(blockchainId.reference);

  //       // Alice Keypair
  //       PrivateKeyPairStrategy aliceSeedStrategy =
  //           privateKeyStrategyFactory.createFromPrivateKeyString(privateKey);
  //       keyPairFactory.generator = aliceSeedStrategy;
  //       final aliceKeyPair = await keyPairFactory.generate();
  //       aliceKeyPair.signer = aliceSeedStrategy;
  //       aliceKeyPair.verifier = aliceSeedStrategy;

  //       // Alice Account
  //       final aliceKeyPairStrategy = keyPairBlockchainAccountStrategyFactory
  //           .createFromKeyPair(aliceKeyPair);
  //       accountFactory.generator = aliceKeyPairStrategy;
  //       final aliceAccount = await accountFactory.generate();
  //       aliceAccount.signer = aliceKeyPairStrategy;
  //       aliceAccount.verifier = aliceKeyPairStrategy;

  //       await ref.read(postRemoteKeypairProvider).call([
  //         Keypair(
  //           id: 'id',
  //           namespace: 'aptos',
  //           reference: '1',
  //           publicKey: aliceKeyPair.publicKey,
  //           strategy: ['signer', 'verifier', 'generator']
  //               .map((purpose) => Strategy(
  //                     strategyType: 'private_key',
  //                     strategyPurpose: purpose,
  //                     shareId: state.shareId,
  //                   ))
  //               .toList(),
  //         ),
  //       ]);

  //       await ref.read(createRemoteAccountProvider).call([
  //         Account(
  //           namespace: 'aptos',
  //           reference: '1',
  //           accountAddress: aliceAccount.blockchainAccountId.address,
  //           strategy: ['signer', 'verifier', 'generator']
  //               .map(
  //                 (purpose) => Strategy(
  //                     strategyType: 'keypair',
  //                     shareId: state.shareId,
  //                     strategyPurpose: purpose,
  //                     keypairId: 'aptos:1:${aliceKeyPair.publicKey}'),
  //               )
  //               .toList(),
  //         ),
  //       ]);

  //       await ref.read(createGroupUseCaseProvider).call(
  //             state.personaName,
  //             Group(
  //               groupName: state.name,
  //               animatedIconUrl: state.iconUrl ?? 'http://www.google.com',
  //               backgroundHexColor:
  //                   colorToHex(state.cardColor.color, includeHashSign: true),
  //               isPrimary: false,
  //               blockchainAccounts: [
  //                 entity.BlockchainAccount(
  //                   namespace: 'aptos',
  //                   reference: '1',
  //                   accountAddress: aliceAccount.blockchainAccountId.address,
  //                 )
  //               ],
  //             ),
  //           );
  //     }
  //   } catch (e) {
  //     logger.e(e);
  //   }
  //   return true;
  // }
}
