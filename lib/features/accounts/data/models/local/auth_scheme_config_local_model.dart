import 'package:objectbox/objectbox.dart';

import 'aptos_account_local_model.dart';
import 'public_key_local_model.dart';

@Entity()
class Ed25519AuthSchemeConfigLocalModel {
  Ed25519AuthSchemeConfigLocalModel({
    required this.aptosAccount,
    required this.publicKey,
  });

  factory Ed25519AuthSchemeConfigLocalModel.withRelation({
    required int localAptosAccountId,
    required int localPublicKeyId,
  }) =>
      Ed25519AuthSchemeConfigLocalModel(
        aptosAccount:
            ToOne<AptosAccountLocalModel>(targetId: localAptosAccountId),
        publicKey: ToOne<PublicKeyLocalModel>(targetId: localPublicKeyId),
      );

  @Id(assignable: false)
  int localId = 0;

  ToOne<PublicKeyLocalModel> publicKey = ToOne<PublicKeyLocalModel>();

  ToOne<AptosAccountLocalModel> aptosAccount = ToOne<AptosAccountLocalModel>();
}
