import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../domain/entities/network_config.dart';
import '../../models/local/network_config_local_model.dart';

class NetworkConfigLocalDataSource {
  NetworkConfigLocalDataSource({required Box<NetworkConfigLocalModel> box})
      : _box = box;
  final Box<NetworkConfigLocalModel> _box;

  NetworkConfigLocalModel store({required NetworkConfig config}) {
    if (getByCaipChainId(caipChainId: config.caipChainId) != null) {
      throw StateError('Network with this CAIP chain ID already exists');
    }

    final NetworkConfigLocalModel model =
        NetworkConfigLocalModel.fromDomain(config);
    _box.put(model);
    return model;
  }

  NetworkConfigLocalModel? get({required int id}) => _box.get(id);

  NetworkConfigLocalModel? getByCaipChainId({required String caipChainId}) =>
      _box
          .query(NetworkConfigLocalModel_.caipChainId.equals(caipChainId))
          .build()
          .findFirst();

  void storeMany(List<NetworkConfig> configs) {
    final List<NetworkConfigLocalModel> models = configs
        .map(
          NetworkConfigLocalModel.fromDomain,
        )
        .toList();
    _box.putMany(models);
  }

  List<NetworkConfigLocalModel> getAll() => _box.getAll();

  bool delete({required int id}) => _box.remove(id);

  bool deleteByCaipChainId({required String caipChainId}) {
    final NetworkConfigLocalModel? config = getByCaipChainId(
      caipChainId: caipChainId,
    );
    return config != null && delete(id: config.localId);
  }

  bool deleteMany(List<String> caipChainIds) {
    final List<NetworkConfigLocalModel> configs = _box
        .query(NetworkConfigLocalModel_.caipChainId.oneOf(caipChainIds))
        .build()
        .find();
    return configs.isNotEmpty &&
        _box.removeMany(
              configs.map((NetworkConfigLocalModel c) => c.localId).toList(),
            ) >
            0;
  }

  int clear() => _box.removeAll();

  int count() => _box.count();

  void update({
    required String caipChainId,
    required Uri rpcUrl,
  }) {
    final NetworkConfigLocalModel? existing =
        getByCaipChainId(caipChainId: caipChainId);
    if (existing == null) {
      throw StateError('Network config not found');
    }

    final NetworkConfigLocalModel updated = NetworkConfigLocalModel(
      caipChainId: caipChainId,
      rpcUrl: rpcUrl.toString(),
    );
    _box.put(updated);
  }
}
