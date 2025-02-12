import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/object_box_service_provider.g.dart';

@Riverpod(keepAlive: true)
Store objectBoxDbInitializer(Ref ref) {
  throw UnimplementedError('Unimplemented objectBoxDbInitializer');
}

@Riverpod(keepAlive: true)
Store objectBoxDbService(Ref ref) => ref.watch(objectBoxDbInitializerProvider);
