import 'package:defy/features/blockchain_account_group_assignment/data/models/local/blockchain_account_group_assignment_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../domain/entities/blockchain_account_group.dart';

@Entity()
class BlockchainAccountGroupLocalModel {
  @Id()
  int localId = 0;

  @Unique(onConflict: ConflictStrategy.fail)
  String remoteId;

  @Unique(onConflict: ConflictStrategy.fail)
  String name;

  String icon;
  String color;

  @Backlink('blockchainAccountGroup')
  final blockchainAccountAssignments =
      ToMany<BlockchainAccountGroupAssignmentLocalModel>();

  BlockchainAccountGroupLocalModel({
    required this.remoteId,
    required this.name,
    required this.icon,
    required this.color,
  });

  BlockchainAccountGroup toDomain() => BlockchainAccountGroup(
        id: remoteId,
        name: name,
        icon: icon,
        color: color,
      );

  static BlockchainAccountGroupLocalModel fromDomain(
          BlockchainAccountGroup group) =>
      BlockchainAccountGroupLocalModel(
        remoteId: group.id,
        name: group.name,
        icon: group.icon,
        color: group.color,
      );
}
