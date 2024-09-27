import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/isar_database_provider.g.dart';

@Riverpod(keepAlive: true)
Isar isarDbInitializer(IsarDbInitializerRef ref) {
  throw UnimplementedError('Unimplemented isarDbInitializer');
}

@Riverpod(keepAlive: true)
IsarDbService isarDbService(IsarDbServiceRef ref) {
  final isar = ref.watch(isarDbInitializerProvider);
  return IsarDbService(isar);
}

class IsarDbService {
  final Isar _isar;

  IsarDbService(this._isar);

  Isar get isar => _isar;

  Future<int> insert<T>(T object) async {
    return await _isar.writeTxn(() async {
      return await _isar.collection<T>().put(object);
    });
  }

  Future<List<T>> getAll<T>() async {
    return await _isar.collection<T>().where().findAll();
  }

  Future<T?> getById<T>(Id id) async {
    return await _isar.collection<T>().get(id);
  }

  Future<bool> delete<T>(Id id) async {
    return await _isar.writeTxn(() async {
      return await _isar.collection<T>().delete(id);
    });
  }

  Future<void> clearAll<T>() async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
    });
  }
}