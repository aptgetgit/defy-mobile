import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/object_box_database_provider.g.dart';

@Riverpod(keepAlive: true)
Store objectBoxDbInitializer(ObjectBoxDbInitializerRef ref) {
  throw UnimplementedError('Unimplemented isarDbInitializer');
}

@Riverpod(keepAlive: true)
Store objectBoxDbService(ObjectBoxDbServiceRef ref) {
  return ref.watch(objectBoxDbInitializerProvider);
}