import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../database/objectbox/objectbox.g.dart';

part 'generated/object_box_store_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Store> objectBoxStore(Ref ref) async => openStore(
      directory:
          join((await getApplicationDocumentsDirectory()).path, 'obx-defy'),
    );
