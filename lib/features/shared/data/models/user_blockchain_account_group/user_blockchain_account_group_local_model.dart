import 'package:defy/features/shared/data/models/user_blockchain_account_group_assignment/user_blockchain_account_group_assignment_local_model.dart';
import 'package:objectbox/objectbox.dart';
import '../../../domain/entities/user_blockchain_account_group.dart';

@Entity()
class UserBlockchainAccountGroupLocalModel {
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
      ToMany<UserBlockchainAccountGroupAssignmentLocalModel>();

  UserBlockchainAccountGroupLocalModel({
    required this.remoteId,
    required this.name,
    required this.icon,
    required this.color,
  });

  UserBlockchainAccountGroup toDomain() => UserBlockchainAccountGroup(
        id: remoteId,
        name: name,
        icon: icon,
        color: color,
      );

  static UserBlockchainAccountGroupLocalModel fromDomain(
          UserBlockchainAccountGroup group) =>
      UserBlockchainAccountGroupLocalModel(
        remoteId: group.id,
        name: group.name,
        icon: group.icon,
        color: group.color,
      );
}
