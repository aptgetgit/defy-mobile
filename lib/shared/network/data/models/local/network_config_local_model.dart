
import 'package:objectbox/objectbox.dart';

import '../../../domain/entities/network_config.dart';

@Entity()
class NetworkConfigLocalModel {
  NetworkConfigLocalModel({
    required this.caipChainId,
    required this.rpcUrl,
  });

  factory NetworkConfigLocalModel.fromDomain(
    NetworkConfig domain,
  ) =>
      NetworkConfigLocalModel(
        caipChainId: domain.caipChainId,
        rpcUrl: domain.rpcUrl.toString(),
      );

  NetworkConfig toDomain() => NetworkConfig(
        caipChainId: caipChainId,
        rpcUrl: Uri.parse(rpcUrl),
      );

  @Id(assignable: false)
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  final String caipChainId;

  final String rpcUrl;

  @override
  String toString() => 'NetworkConfigLocalModel{'
      '\n  id: $id,'
      '\n  caipChainId: $caipChainId,'
      '\n  rpcUrl: $rpcUrl,'
      '\n}';
}
